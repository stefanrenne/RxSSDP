//
//  SSDPResponse.swift
//  ssdp
//
//  Created by Stefan Renne on 18/06/2018.
//  Copyright © 2018 Uberweb. All rights reserved.
//

import Foundation

open class SSDPResponse {
    
    public let data: [String: String]
    init(data: [String: String]) {
        self.data = data
    }
}

extension SSDPResponse: Equatable {
    
    public static func ==(lhs: SSDPResponse, rhs: SSDPResponse) -> Bool {
        return lhs.data == rhs.data
    }
}

extension SSDPResponse {
    
    public var host: String? {
        return data["HOST"]
    }
    
    public var searchTarget: String? {
        return data["ST"]
    }
    
    public var location: String? {
        return data["LOCATION"]
    }
    
    public var server: String? {
        return data["SERVER"]
    }
    
    public var uniqueServiceName: String? {
        return data["USN"]
    }
    
}
