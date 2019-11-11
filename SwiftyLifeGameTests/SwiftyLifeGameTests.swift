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
        
        //  | | | |
        //  | |■| |
        //  | | | |
        LifeGame.shared.setStatus(point: CGPoint(x: 1, y: 1), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 0)

        //underpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■| | |
        //  | |■| |
        //  | | | |
        LifeGame.shared.setStatus(point: CGPoint(x: 0, y: 0), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 1)

        //underpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■| | |
        //  |■|■| |
        //  | | | |
        LifeGame.shared.setStatus(point: CGPoint(x: 0, y: 1), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 2)

        //lives on to the next generation
        XCTAssertTrue(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))
        
        //  |■| | |
        //  |■|■| |
        //  |■| | |
        LifeGame.shared.setStatus(point: CGPoint(x: 0, y: 2), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 3)
        
        //lives on to the next generation
        XCTAssertTrue(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■|■| |
        //  |■|■| |
        //  |■| | |
        LifeGame.shared.setStatus(point: CGPoint(x: 1, y: 0), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 4)
        
        //overpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■|■|■|
        //  |■|■| |
        //  |■| | |
        LifeGame.shared.setStatus(point: CGPoint(x: 2, y: 0), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 5)

        //overpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■|■|■|
        //  |■|■|■|
        //  |■| | |
        LifeGame.shared.setStatus(point: CGPoint(x: 2, y: 1), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 6)

        //overpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■|■|■|
        //  |■|■|■|
        //  |■| |■|
        LifeGame.shared.setStatus(point: CGPoint(x: 2, y: 2), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 7)

        //overpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

        //  |■|■|■|
        //  |■|■|■|
        //  |■|■|■|
        LifeGame.shared.setStatus(point: CGPoint(x: 1, y: 2), status: true)
        XCTAssertTrue(LifeGame.shared.countNeighbors(x: 1, y: 1) == 8)

        //overpopulation
        XCTAssertFalse(LifeGame.shared.checkCell(point: CGPoint(x:1, y:1)))

    }

}
