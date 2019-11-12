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
    let lg = LifeGame.shared
    
    override func setUp() {
        lg.clear()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNormalCheck() {
        
        lg.clear()
        
        //  | | | |
        //  | |■| |
        //  | | | |
        lg.setStatus(point: CGPoint(x: 1, y: 1), status: true)
        
        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 0)

        //under population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 1, y: 1)))

        //  |■| | |
        //  | |■| |
        //  | | | |
        lg.setStatus(point: CGPoint(x: 0, y: 0), status: true)

        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 1)

        // under population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 1, y: 1)))
        
        // check x:2 y:1 (die)
        XCTAssertTrue(lg.countNeighbors(x: 2, y: 1) == 1)
        
        // remains dead on the next generation
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 2, y: 1)))

        //  |■| | |
        //  |■|■| |
        //  | | | |
        lg.setStatus(point: CGPoint(x: 0, y: 1), status: true)
        
        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 2)

        // lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 1, y: 1)))

        // check x:1 y:0 (die)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 0) == 3)

        // living in the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 1, y: 0)))
        
        //  |■| | |
        //  |■|■| |
        //  |■| | |
        lg.setStatus(point: CGPoint(x: 0, y: 2), status: true)
        
        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 3)
        
        // lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 1, y: 1)))

        //  |■|■| |
        //  |■|■| |
        //  |■| | |
        lg.setStatus(point: CGPoint(x: 1, y: 0), status: true)
        
        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 4)
        
        // over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 1, y: 1)))

        //  |■|■|■|
        //  |■|■| |
        //  |■| | |
        lg.setStatus(point: CGPoint(x: 2, y: 0), status: true)

        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 5)

        // over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 1, y: 1)))

        //  |■|■|■|
        //  |■|■|■|
        //  |■| | |
        lg.setStatus(point: CGPoint(x: 2, y: 1), status: true)
        
        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 6)

        // over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 1, y: 1)))

        //  |■|■|■|
        //  |■|■|■|
        //  |■| |■|
        lg.setStatus(point: CGPoint(x: 2, y: 2), status: true)

        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 7)

        // over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x :1, y: 1)))

        //  |■|■|■|
        //  |■|■|■|
        //  |■|■|■|
        lg.setStatus(point: CGPoint(x: 1, y: 2), status: true)

        // check x:1 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 1, y: 1) == 8)

        // over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 1, y: 1)))

    }
    
    func testBoundaryCheck () {
        
        lg.clear()
        
        //  0 1 2  .. 17 18 19
        //  |■| | | .. | | |■|
        //  | | | | .. | | | |
        //  | | | | .. | | | |
        lg.setStatus(point: CGPoint(x: 0, y: 0), status: true)
        lg.setStatus(point: CGPoint(x: lg.columns - 1, y: 0), status: true)
        
        // check x:0 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: 0) == 1)
        
        // under population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 0, y: 0)))

        // check x:19 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: 0) == 1)
        
        // under population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: 0)))
       
        
        //  0 1 2  .. 17 18 19
        //  |■| | | .. | | |■|
        //  | | | | .. | | |■|
        //  | | | | .. | | | |
        lg.setStatus(point: CGPoint(x: lg.columns - 1, y: 1), status: true)

        // check x:0 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: 0) == 2)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 0, y: 0)))
        
        // check x:19 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: 0) == 2)

        // lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x:lg.columns - 1, y: 0)))

        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 | | | | .. | | |■|
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■| | | .. | | | |
        lg.setStatus(point: CGPoint(x: 0, y: lg.rows - 1), status: true)
        
        // check x:0 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: 0) == 3)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 0, y: 0)))

        // check x:19 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: 0) == 3)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: 0)))
        
        // check x:0 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: lg.rows - 1) == 2)

        // lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 0, y: lg.rows - 1)))
        
        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 | | | | .. | | |■|
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■|■| | .. | | | |
        lg.setStatus(point: CGPoint(x: 1, y: lg.rows - 1), status: true)
        
        // check x:0 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: 0) == 4)

        //over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 0, y: 0)))
        
        // check x:19 y:0 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: 0) == 3)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: 0)))
        
        // check x:0 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: lg.rows - 1) == 3)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 0, y: lg.rows - 1)))

        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 |■| | | .. | | |■|
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■|■| | .. | | | |
        lg.setStatus(point: CGPoint(x: 0, y: 1), status: true)
        
        // check x:0 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: 0) == 5)

        //over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: 0, y: 0)))

        // check x:19 y:1 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: 0) == 4)

        //over population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x:lg.columns - 1, y: 0)))
        
        // check x:0 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: 0, y: lg.rows - 1) == 3)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: 0, y: lg.rows - 1)))

        //    0 1 2  .. 17 18 19
        //  0 | | | | .. | | | |
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 | | | | .. | | |■|
        lg.clear()
        lg.setStatus(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1), status: true)
        
        // check x:19 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 0)

        //under population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))

        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | | |
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 | | | | .. | | |■|
        lg.setStatus(point: CGPoint(x: 0, y: 0), status: true)
        
        // check x:19 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 1)

        //under population
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))

        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 | | | | .. | | |■|
        lg.setStatus(point: CGPoint(x: lg.columns - 1, y: 0), status: true)
        
        // check x:19 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 2)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))

        
        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■| | | .. | | |■|
        lg.setStatus(point: CGPoint(x: 0, y: lg.rows - 1), status: true)
        
        // check x:19 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 3)

        //lives on to the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))

        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■| | | .. | |■|■|
        lg.setStatus(point: CGPoint(x: lg.columns - 2, y: lg.rows - 2), status: true)
        
        // check x:19 y:29 (live)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 4)

        //over popultation
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))

        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | | |
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■| | | .. | | | |
        lg.clear()
        lg.setStatus(point: CGPoint(x: 0, y: 0), status: true)
        lg.setStatus(point: CGPoint(x: 0, y: lg.rows - 1), status: true)
        
        // check x:19 y:29 (die)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 2)

        //remains dead on the next generation
        XCTAssertFalse(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))
        
        //    0 1 2  .. 17 18 19
        //  0 |■| | | .. | | |■|
        //  1 | | | | .. | | | |
        //  2 | | | | .. | | | |
        //       :         :
        // 27 | | | | .. | | | |
        // 28 | | | | .. | | | |
        // 29 |■| | | .. | | | |
        lg.clear()
        lg.setStatus(point: CGPoint(x: 0, y: 0), status: true)
        lg.setStatus(point: CGPoint(x: 0, y: lg.rows - 1), status: true)
        lg.setStatus(point: CGPoint(x: lg.columns - 1, y: 0), status: true)
        
        // check x:19 y:29 (die)
        XCTAssertTrue(lg.countNeighbors(x: lg.columns - 1, y: lg.rows - 1) == 3)

        //living in the next generation
        XCTAssertTrue(lg.checkCell(point: CGPoint(x: lg.columns - 1, y: lg.rows - 1)))
    }

}
