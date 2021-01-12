//
//  TermpaperTests.swift
//  TermpaperTests
//
//  Created by Anasva on 19.05.2020.
//  Copyright © 2020 Anasva. All rights reserved.
//

import XCTest
@testable import TermPaper

class TermpaperTests: XCTestCase {
    
    override func setUp() {
       super.setUp()
    }

    func testAPIForWether(){
        let vc = weatherVC()
        XCTAssertEqual(vc.apiKey, "b27d62acdeaa9d990b11c577aff1215c")
    }
    
    func testLonANDLat(){
        let vc = weatherVC()
        XCTAssertEqual(vc.lat, 50.45466)
        XCTAssertEqual(vc.lon, 30.5238)
    }
    
    func testTimeToSecondsCalculation(){
        let vc = Button1VC()
        XCTAssertEqual(vc.dateToSeconds(hours: 9, minutes: 34, seconds: 34), 9 * 3600 + 34 * 60 + 34 )
    }
}
