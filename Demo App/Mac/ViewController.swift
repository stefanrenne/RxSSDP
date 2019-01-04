//
//  ViewController.swift
//  Mac Demo App
//
//  Created by Stefan Renne on 04/01/2019.
//  Copyright © 2019 Uberweb. All rights reserved.
//

import Cocoa
import RxSSDP
import RxSwift

class ViewController: NSViewController {

    let disposeBag = DisposeBag()
    let repository: SSDPRepository = SSDPRepositoryImpl()
    @IBOutlet var textView: NSTextView!
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        repository
            .scan(searchTarget: "urn:schemas-upnp-org:device:ZonePlayer:1")
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] (responses) in
                self?.textView.string = responses.mapToString()
            }, onError: { [weak self] (error) in
                self?.textView.string = "ERROR: \(error.localizedDescription)"
            })
            .disposed(by: disposeBag)
    }
}

extension Array where Element == SSDPResponse {
    func mapToString() -> String {
        guard count > 0 else {
            return "No Responses"
        }
        
        return compactMap({ (response) -> String in
            return response.data.description
        }).joined(separator: "\n\n====================\n\n")
    }
}
