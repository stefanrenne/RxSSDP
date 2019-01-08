//
//  SSDPResponse+String.swift
//  RxSSDP
//
//  Created by Stefan Renne on 08/01/2019.
//  Copyright © 2019 Uberweb. All rights reserved.
//

import Foundation
import RxSSDP
import RxSwift


extension Array where Element == SSDPResponse {
    func mapToString() -> String {
        guard count > 0 else {
            return "No Responses"
        }
        
        return compactMap({ (response) -> String in
            return response.description
        }).joined(separator: "\n\n====================\n\n")
    }
}
