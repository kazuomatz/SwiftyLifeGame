//
//  Pattern.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/13.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import Foundation
import UIKit

public class Pattern {
    
    var _name = NSLocalizedString("Oscillator", comment: "")
    var cells:[CGPoint] {
        get {
            return []
        }
    }
    var name:String  {
        get {
            return _name
        }
    }
    
    var size:CGSize {
        get {
            var xMin = -1
            var xMax = -1
            var yMin = -1
            var yMax = -1
            
            for (index, point) in self.cells.enumerated() {
                let x = Int(point.x)
                let y = Int(point.y)
                if index == 0 {
                    xMin = x
                    xMax = x
                    yMin = y
                    yMax = y
                }
                if xMin > x {
                    xMin = x
                }
                if xMax < x {
                    xMax = x
                }
                if yMin > y {
                    yMin = x
                }
                if yMax < y {
                    yMax = y
                }
            }
            return CGSize(width: xMax - xMin + 1, height: yMax - yMin + 1)
        }
    }
}

public class Random: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Random", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            var points = [CGPoint]()
            for row in 0 ..<  LifeGame.shared.rows {
                for column in 0 ..< LifeGame.shared.columns {
                    let val = Int.random(in: 0..<1000)
                    if val % 7 == 1 {
                        points.append(CGPoint(x: column, y: row))
                    }
                }
            }
            return points
        }
    }
}

// Blinker
public class Blinker: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Blinker", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:0, y:0),
                CGPoint(x:1, y:0),
                CGPoint(x:2, y:0)
            ]
        }
    }
}

public class TrafficLight: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Traffic Light", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:2, y:0),
                CGPoint(x:3, y:0),
                CGPoint(x:4, y:0),
            
                CGPoint(x:0, y:2),
                CGPoint(x:0, y:3),
                CGPoint(x:0, y:4),

                CGPoint(x:2, y:6),
                CGPoint(x:3, y:6),
                CGPoint(x:4, y:6),
            
                CGPoint(x:6, y:2),
                CGPoint(x:6, y:3),
                CGPoint(x:6, y:4)
            ]
        }
    }
}


public class Watch: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Watch", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:6, y:0),
                CGPoint(x:7, y:0),
                CGPoint(x:6, y:1),
                CGPoint(x:7, y:1),
                
                CGPoint(x:0, y:4),
                CGPoint(x:0, y:5),
                CGPoint(x:1, y:4),
                CGPoint(x:1, y:5),

                CGPoint(x:4, y:3),
                CGPoint(x:5, y:3),
                CGPoint(x:6, y:3),
                CGPoint(x:7, y:3),
                
                
                CGPoint(x:3, y:4),
                CGPoint(x:3, y:5),
                CGPoint(x:3, y:6),
                CGPoint(x:3, y:7),
                
                CGPoint(x:8, y:4),
                CGPoint(x:8, y:5),
                CGPoint(x:8, y:6),
                CGPoint(x:8, y:7),

                CGPoint(x:4, y:8),
                CGPoint(x:5, y:8),
                CGPoint(x:6, y:8),
                CGPoint(x:7, y:8),

                CGPoint(x:4, y:10),
                CGPoint(x:5, y:10),
                CGPoint(x:4, y:11),
                CGPoint(x:5, y:11),

                CGPoint(x:10, y:6),
                CGPoint(x:10, y:7),
                CGPoint(x:11, y:6),
                CGPoint(x:11, y:7),
                
                CGPoint(x:6, y:4),
                CGPoint(x:5, y:5),
                CGPoint(x:5, y:6),
            ]
        }
    }
}

public class Pulsar: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Pulsar", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:2, y:0),
                CGPoint(x:3, y:0),
                CGPoint(x:4, y:0),
                
                CGPoint(x:8, y:0),
                CGPoint(x:9, y:0),
                CGPoint(x:10, y:0),
                
                CGPoint(x:0, y:2),
                CGPoint(x:0, y:3),
                CGPoint(x:0, y:4),

                CGPoint(x:5, y:2),
                CGPoint(x:5, y:3),
                CGPoint(x:5, y:4),
                
                CGPoint(x:7, y:2),
                CGPoint(x:7, y:3),
                CGPoint(x:7, y:4),

                CGPoint(x:12, y:2),
                CGPoint(x:12, y:3),
                CGPoint(x:12, y:4),

                CGPoint(x:2, y:5),
                CGPoint(x:3, y:5),
                CGPoint(x:4, y:5),
                
                CGPoint(x:8, y:5),
                CGPoint(x:9, y:5),
                CGPoint(x:10, y:5),
                
                CGPoint(x:2, y:7),
                CGPoint(x:3, y:7),
                CGPoint(x:4, y:7),
                
                CGPoint(x:8, y:7),
                CGPoint(x:9, y:7),
                CGPoint(x:10, y:7),
                
                CGPoint(x:0, y:8),
                CGPoint(x:0, y:9),
                CGPoint(x:0, y:10),

                CGPoint(x:5, y:8),
                CGPoint(x:5, y:9),
                CGPoint(x:5, y:10),
                
                CGPoint(x:7, y:8),
                CGPoint(x:7, y:9),
                CGPoint(x:7, y:10),

                CGPoint(x:12, y:8),
                CGPoint(x:12, y:9),
                CGPoint(x:12, y:10),

                CGPoint(x:2, y:12),
                CGPoint(x:3, y:12),
                CGPoint(x:4, y:12),
                
                CGPoint(x:8, y:12),
                CGPoint(x:9, y:12),
                CGPoint(x:10, y:12)
            ]
        }
    }
}

public class Galaxy: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Galaxy", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:0, y:0),
                CGPoint(x:1, y:0),
                CGPoint(x:0, y:1),
                CGPoint(x:1, y:1),
                CGPoint(x:0, y:2),
                CGPoint(x:1, y:2),
                CGPoint(x:0, y:3),
                CGPoint(x:1, y:3),
                CGPoint(x:0, y:4),
                CGPoint(x:1, y:4),
                CGPoint(x:0, y:5),
                CGPoint(x:1, y:5),
                
                CGPoint(x:3, y:0),
                CGPoint(x:4, y:0),
                CGPoint(x:5, y:0),
                CGPoint(x:6, y:0),
                CGPoint(x:7, y:0),
                CGPoint(x:8, y:0),
                CGPoint(x:3, y:1),
                CGPoint(x:4, y:1),
                CGPoint(x:5, y:1),
                CGPoint(x:6, y:1),
                CGPoint(x:7, y:1),
                CGPoint(x:8, y:1),
                
                CGPoint(x:0, y:7),
                CGPoint(x:1, y:7),
                CGPoint(x:2, y:7),
                CGPoint(x:3, y:7),
                CGPoint(x:4, y:7),
                CGPoint(x:5, y:7),
                CGPoint(x:0, y:8),
                CGPoint(x:1, y:8),
                CGPoint(x:2, y:8),
                CGPoint(x:3, y:8),
                CGPoint(x:4, y:8),
                CGPoint(x:5, y:8),
                
                CGPoint(x:7, y:3),
                CGPoint(x:7, y:4),
                CGPoint(x:7, y:5),
                CGPoint(x:7, y:6),
                CGPoint(x:7, y:7),
                CGPoint(x:7, y:8),
                CGPoint(x:8, y:3),
                CGPoint(x:8, y:4),
                CGPoint(x:8, y:5),
                CGPoint(x:8, y:6),
                CGPoint(x:8, y:7),
                CGPoint(x:8, y:8)
        ]}
    }
}


class Pentadecathlon: Pattern {

    override init() {
        super.init()
        _name = NSLocalizedString("Pentadecathlon", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:1, y:0),
                CGPoint(x:2, y:0),
                CGPoint(x:9, y:0),
                CGPoint(x:10, y:0),

                CGPoint(x:0, y:1),
                CGPoint(x:3, y:1),
                CGPoint(x:8, y:1),
                CGPoint(x:11, y:1),

                CGPoint(x:0, y:2),
                CGPoint(x:3, y:2),
                CGPoint(x:8, y:2),
                CGPoint(x:11, y:2),

                CGPoint(x:0, y:3),
                CGPoint(x:3, y:3),
                CGPoint(x:8, y:3),
                CGPoint(x:11, y:3),

                CGPoint(x:1, y:4),
                CGPoint(x:2, y:4),
                CGPoint(x:9, y:4),
                CGPoint(x:10, y:4)
            ]}
    }
}

class Glider: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("Glider", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return  [
                CGPoint(x:0, y:0),
                CGPoint(x:1, y:0),
                CGPoint(x:2, y:0),
                CGPoint(x:0, y:1),
                CGPoint(x:1, y:2)
            ]
        }
    }
}


class DieHard: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("DieHard", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return [
                CGPoint(x:7, y:0),
                CGPoint(x:1, y:1),
                CGPoint(x:2, y:1),
                CGPoint(x:2, y:2),
                CGPoint(x:6, y:2),
                CGPoint(x:7, y:2),
                CGPoint(x:8, y:2)
            ]
        }
    }
}

class SchickEngineB: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("SchickEngine(B-heptmino)", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return [
                CGPoint(x:3, y:0),
                CGPoint(x:4, y:1),
                CGPoint(x:0, y:2),
                CGPoint(x:4, y:2),

                CGPoint(x:1, y:3),
                CGPoint(x:2, y:3),
                CGPoint(x:3, y:3),
                CGPoint(x:4, y:3),

                CGPoint(x:0, y:7),
                CGPoint(x:1, y:8),
                
                CGPoint(x:2, y:8),
                CGPoint(x:2, y:9),
                CGPoint(x:2, y:10),
                
                CGPoint(x:1, y:11),
                
                CGPoint(x:3, y:14),
                CGPoint(x:4, y:15),
                CGPoint(x:0, y:16),
                CGPoint(x:4, y:16),
                
                CGPoint(x:1, y:17),
                CGPoint(x:2, y:17),
                CGPoint(x:3, y:17),
                CGPoint(x:4, y:17)
        ]
        }
    }
}

class SchickEngineT: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("SchickEngine(T-Tetromino)", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return [
                CGPoint(x:5, y:0),
                CGPoint(x:6, y:0),
                CGPoint(x:7, y:0),
                CGPoint(x:8, y:0),

                CGPoint(x:4, y:1),
                CGPoint(x:8, y:1),
                CGPoint(x:8, y:2),

                CGPoint(x:0, y:3),
                CGPoint(x:1, y:3),
                CGPoint(x:4, y:3),
                CGPoint(x:7, y:3),

                CGPoint(x:0, y:4),
                CGPoint(x:1, y:4),
                CGPoint(x:2, y:4),
                
                CGPoint(x:0, y:5),
                CGPoint(x:1, y:5),
                CGPoint(x:4, y:5),
                CGPoint(x:7, y:5),

                CGPoint(x:8, y:6),
                CGPoint(x:4, y:7),
                CGPoint(x:8, y:7),
                CGPoint(x:8, y:7),
                
                CGPoint(x:5, y:8),
                CGPoint(x:6, y:8),
                CGPoint(x:7, y:8),
                CGPoint(x:8, y:8)
            ]
        }
    }
}

class Acorn: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("Acorn", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return [
                CGPoint(x:1, y:0),
                CGPoint(x:3, y:1),
                CGPoint(x:0, y:2),
                CGPoint(x:1, y:2),
                CGPoint(x:4, y:2),
                CGPoint(x:5, y:2),
                CGPoint(x:6, y:2)
            ]
        }
    }
}

class Octagon: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("Octagon", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return [
                CGPoint(x:3, y:0),
                CGPoint(x:4, y:0),
                
                CGPoint(x:2, y:1),
                CGPoint(x:5, y:1),

                CGPoint(x:1, y:2),
                CGPoint(x:6, y:2),

                CGPoint(x:0, y:3),
                CGPoint(x:0, y:4),

                CGPoint(x:7, y:3),
                CGPoint(x:7, y:4),

                CGPoint(x:1, y:5),
                CGPoint(x:6, y:5),

                CGPoint(x:2, y:6),
                CGPoint(x:5, y:6),

                CGPoint(x:3, y:7),
                CGPoint(x:4, y:7),

            ]
        }
    }
}

class SpaceShipHeavyWeight: Pattern {
    override init() {
        super.init()
        _name = NSLocalizedString("Space Ship(Heavy Weight)", comment: "")
    }
    override var cells:[CGPoint] {
        get {
            return [
                CGPoint(x:3, y:0),
                CGPoint(x:4, y:0),
                CGPoint(x:1, y:1),
                CGPoint(x:6, y:1),
                
                CGPoint(x:0, y:2),
                CGPoint(x:0, y:3),
                CGPoint(x:6, y:3),

                CGPoint(x:0, y:4),
                CGPoint(x:1, y:4),
                CGPoint(x:2, y:4),
                CGPoint(x:3, y:4),
                CGPoint(x:4, y:4),
                CGPoint(x:5, y:4)
            ]
        }
    }
}
