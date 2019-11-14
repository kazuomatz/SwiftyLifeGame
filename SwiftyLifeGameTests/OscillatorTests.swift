//
//  OscillatorTexts.swift
//  SwiftyLifeGameTests
//
//  Created by Kazuo Matsunaga on 2019/11/13.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import XCTest

class OscillatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testCellSize() {
        let blinker = Blinker()
        XCTAssertTrue(blinker.size.width == 3)
        XCTAssertTrue(blinker.size.height == 1)

        let trafficLight = TrafficLight()
        XCTAssertTrue(trafficLight.size.width == 7)
        XCTAssertTrue(trafficLight.size.height == 7)

        let pulsar = Pulsar()
        XCTAssertTrue(pulsar.size.width == 13)
        XCTAssertTrue(pulsar.size.height == 13)
    }
}
