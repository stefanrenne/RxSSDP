//
//  SSDPSettings.swift
//  RxSSDP
//
//  Created by Stefan Renne on 15/04/2018.
//  Copyright © 2018 Uberweb. All rights reserved.
//

import Foundation
import RxSwift

/**
 * In `SSDPSettings` all general settings are saved, make sure to change these values before the first your first SSDP Search is performed.
 */
open class SSDPSettings {
    
    /**
     * singleton variable to access all RxSonosLib settings
     */
    static let shared: SSDPSettings = SSDPSettings()
    
    /**
     * Maximum of SSDP devices to be returned in the search timespan
     */
    let maxBufferdItems: Int = 100
    
    /**
     * Maximum time the SSDP devices are bufferd
     */
    let maxBufferdTime: RxTimeInterval = 6
    
    /**
     * scheduler on which the search is being performed
     */
    let scheduler: SchedulerType = SerialDispatchQueueScheduler(qos: .userInitiated)
}