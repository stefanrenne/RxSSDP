//
//  SSDPResponse.swift
//  RxSSDP
//
//  Created by Stefan Renne on 18/06/2018.
//  Copyright © 2018 Uberweb. All rights reserved.
//

import Foundation

public struct SSDPResponse: Codable {
    private let data: [String: String]
    
    init(data: [String: String]) {
        self.data = data
    }
    
    subscript(index: String) -> String? {
        return data[index]
    }
}

extension SSDPResponse: Equatable {
    
    public static func == (lhs: SSDPResponse, rhs: SSDPResponse) -> Bool {
        return lhs.data == rhs.data
    }
}

extension SSDPResponse {
    
    public var host: String? {
        return self["HOST"]
    }
    
    public var searchTarget: String? {
        return self["ST"]
    }
    
    public var location: String? {
        return self["LOCATION"]
    }
    
    public var server: String? {
        return self["SERVER"]
    }
    
    public var uniqueServiceName: String? {
        return self["USN"]
    }
    
}
