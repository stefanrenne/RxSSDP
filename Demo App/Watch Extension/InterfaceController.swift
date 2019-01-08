//
//  InterfaceController.swift
//  Watch Sample App Extension
//
//  Created by Stefan Renne on 08/01/2019.
//  Copyright © 2019 Uberweb. All rights reserved.
//

import WatchKit
import Foundation
import RxSSDP
import RxSwift

class InterfaceController: WKInterfaceController {

    let disposeBag = DisposeBag()
    let repository: SSDPRepository = SSDPRepositoryImpl()
    @IBOutlet var textLabel: WKInterfaceLabel!
    
    override func willActivate() {
        super.willActivate()
        
        repository
            .scan(searchTarget: "urn:schemas-upnp-org:device:ZonePlayer:1")
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] (responses) in
                self?.textLabel.setText(responses.mapToString())
            }, onError: { [weak self] (error) in
                self?.textLabel.setText("ERROR: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }

}
