//
//  ViewController.swift
//  Sample App
//
//  Created by Stefan Renne on 17/03/2018.
//  Copyright © 2018 Uberweb. All rights reserved.
//

import UIKit
import RxSSDP
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let repository: SSDPRepository = SSDPRepositoryImpl()
    @IBOutlet var textView: UITextView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        repository
            .scan(searchTarget: "urn:schemas-upnp-org:device:ZonePlayer:1")
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] (responses) in
                self?.textView.text = responses.mapToString()
            }, onError: { [weak self] (error) in
                self?.textView.text = "ERROR: \(error.localizedDescription)"
            })
            .disposed(by: disposeBag)
    }
}
