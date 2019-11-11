//
//  SwiftyLifeGameTests.swift
//  SwiftyLifeGameTests
//
//  Created by Kazuo Matsunaga on 2019/11/10.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import XCTest
import UIKit
@testable import SwiftyLifeGame

class SwiftyLifeGameTests: XCTestCase {

    override func setUp() {
        LifeGame.shared.clear()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLifeCheck() {
        
        LifeGame.shared.clear()
        LifeGame.shared.setStatus(point: CGPoint(x: 1, y: 1), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 0)
        
        LifeGame.shared.setStatus(point: CGPoint(x: 0, y: 0), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 1)

        LifeGame.shared.setStatus(point: CGPoint(x: 0, y: 1), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 2)

        LifeGame.shared.setStatus(point: CGPoint(x: 0, y: 2), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 3)

        
    }

}
