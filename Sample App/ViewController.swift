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
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let repository: SSDPRepository = SSDPRepositoryImpl()
    @IBOutlet var textView: UITextView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        repository
            .scan(broadcastAddress: "255.255.255.255", searchTarget: "urn:schemas-upnp-org:device:ZonePlayer:1")
            .map({ (responses) -> String in
                return responses
                    .compactMap({ (response) -> String in
                        return response.description
                    })
                    .joined(separator: "\n\n====================\n\n")
            })
            .bind(to: textView.rx.text)
            .disposed(by: disposeBag)
    }
}

