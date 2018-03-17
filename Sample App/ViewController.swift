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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        repository.scan(broadcastAddress: "255.255.255.255", searchTarget: "urn:schemas-upnp-org:device:ZonePlayer:1", maxTimeSpan: 3, maxCount: 100)
            .subscribe(onNext: { (responses) in
            print(responses)
        }, onError: { (error) in
            print(error.localizedDescription)
        }, onCompleted: {
            print("completed")
        }).disposed(by: disposeBag)
        
        
    }


}

