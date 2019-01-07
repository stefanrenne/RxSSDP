//
//  SSDPMessageParserTests.swift
//  RxSSDPTests
//
//  Created by Stefan Renne on 07/01/2019.
//  Copyright © 2019 Uberweb. All rights reserved.
//

import XCTest
@testable import RxSSDP

class SSDPMessageParserTests: XCTestCase {
    
    func testItCantParseAMessageThatsNotHTTP() throws {
        let message = "USN:uuid:RINCON_000002::urn:schemas-upnp-org:device:ZonePlayer:1\n\nSERVER:Linux UPnP/1.0 Sonos/34.7-34220 (ANVIL)\n\nEXT:\n\nST:urn:schemas-upnp-org:device:ZonePlayer:1\n\nLOCATION:http://192.168.3.26:1400/xml/device_description.xml\n\nCACHE-CONTROL:max-age = 1800\n\nX-RINCON-WIFIMODE:0\n\nX-RINCON-VARIANT:0\n\nX-RINCON-HOUSEHOLD:SONOS_HOUSEHOLD_1\n\nX-RINCON-BOOTSEQ:92\n\nX-RINCON-PROXY:RINCON_000001\n\n"
        let response = SSDPMessageParser(message: message).parse()
        
        XCTAssertNil(response)
    }

    func testItCanParseASonosSSDPResponse() throws {
        let message = "HTTP/1.1\n\nUSN:uuid:RINCON_000002::urn:schemas-upnp-org:device:ZonePlayer:1\n\nSERVER:Linux UPnP/1.0 Sonos/34.7-34220 (ANVIL)\n\nEXT:\n\nST:urn:schemas-upnp-org:device:ZonePlayer:1\n\nLOCATION:http://192.168.3.26:1400/xml/device_description.xml\n\nCACHE-CONTROL:max-age = 1800\n\nX-RINCON-WIFIMODE:0\n\nX-RINCON-VARIANT:0\n\nX-RINCON-HOUSEHOLD:SONOS_HOUSEHOLD_1\n\nX-RINCON-BOOTSEQ:92\n\nX-RINCON-PROXY:RINCON_000001\n\n"
        let response = SSDPMessageParser(message: message).parse()
        
        XCTAssertNil(response?.host)
        XCTAssertEqual(response?.searchTarget, "urn:schemas-upnp-org:device:ZonePlayer:1")
        XCTAssertEqual(response?.location, "http://192.168.3.26:1400/xml/device_description.xml")
        XCTAssertEqual(response?.server, "Linux UPnP/1.0 Sonos/34.7-34220 (ANVIL)")
        XCTAssertEqual(response?.uniqueServiceName, "uuid:RINCON_000002::urn:schemas-upnp-org:device:ZonePlayer:1")
        XCTAssertEqual(response?["CACHE-CONTROL"], "max-age = 1800")
        XCTAssertEqual(response?["X-RINCON-WIFIMODE"], "0")
        XCTAssertEqual(response?["X-RINCON-VARIANT"], "0")
        XCTAssertEqual(response?["X-RINCON-HOUSEHOLD"], "SONOS_HOUSEHOLD_1")
        XCTAssertEqual(response?["X-RINCON-BOOTSEQ"], "92")
        XCTAssertEqual(response?["X-RINCON-PROXY"], "RINCON_000001")
    }
    
    func testItCanParseAPhilipeHueSSDPResponse() throws {
        let message = "HTTP/1.1\n\nUSN:uuid:00000000-0000-0000-0000-000000000000::upnp:rootdevice\n\nSERVER:FreeRTOS/7.4.2 UPnP/1.0 IpBridge/1.15.0\n\nEXT:\n\nST:upnp:rootdevice\n\nLOCATION:http://10.0.1.2:80/description.xml\n\nCACHE-CONTROL:max-age=100\n\nHOST:239.255.255.250:1900\n\nhue-bridgeid:00100800FF000900\n\n"
        let response = SSDPMessageParser(message: message).parse()
        
        XCTAssertEqual(response?.host, "239.255.255.250:1900")
        XCTAssertEqual(response?.searchTarget, "upnp:rootdevice")
        XCTAssertEqual(response?.location, "http://10.0.1.2:80/description.xml")
        XCTAssertEqual(response?.server, "FreeRTOS/7.4.2 UPnP/1.0 IpBridge/1.15.0")
        XCTAssertEqual(response?.uniqueServiceName, "uuid:00000000-0000-0000-0000-000000000000::upnp:rootdevice")
        XCTAssertEqual(response?["hue-bridgeid"], "00100800FF000900")
    }
}
