//
//  LifeGame.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/10.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import Foundation
import UIKit

class LifeGame {
    let columns = 20
    let rows = 30
    var status = [[Bool]]()
    
    static let shared = LifeGame()
    private init() {
        randamize()
    }
    
    public func randamize() {
        status = [[Bool]]()
        for _ in 0 ..< rows {
            var rows = [Bool]()
            for _ in 0 ..< columns {
                let val = Int.random(in: 0..<1000)
                rows.append(val % 2 == 0)
            }
            status.append(rows)
        }
    }
    
    public func clear() {
        status = [[Bool]]()
        for _ in 0 ..< rows {
            var rows = [Bool]()
            for _ in 0 ..< columns {
                rows.append(false)
            }
            status.append(rows)
        }
    }

    public func checkLife()  {
        var newStatus = [[Bool]]()
        for row in 0 ..< rows {
            var rows = [Bool]()
            for column  in 0 ..< columns {
                rows.append(checkCell(point:CGPoint(x: column, y: row)))
            }
            newStatus.append(rows)
        }
        self.status = newStatus
    }
    
    public func setStatus(index:Int, status:Bool) {
        let x = index % LifeGame.shared.columns
        let y = index / LifeGame.shared.rows
        self.status[y][x] = status
    }
    
    public func getStatus(index: Int) -> Bool {
        let x = index % LifeGame.shared.columns
        let y = index / LifeGame.shared.rows
        return self.status[y][x]
    }
    
    private func checkCell(point: CGPoint) -> Bool {
        
        let x = Int(point.x)
        let y = Int(point.y)
        
        let points = [
            CGPoint(x: x-1 , y: y-1),
            CGPoint(x: x-1 , y: y),
            CGPoint(x: x-1 , y: y+1),

            CGPoint(x: x , y: y-1),
            CGPoint(x: x , y: y+1),

            CGPoint(x: x+1 , y: y-1),
            CGPoint(x: x+1 , y: y),
            CGPoint(x: x+1 , y: y+1),
            ]

        var count:Int = 0

        points.forEach {
            let point = $0
            var x = Int(point.x)
            var y = Int(point.y)
            
            if x < 0 {
                x = columns - 1
            }
            if y < 0 {
                y = rows - 1
            }
            if x == columns {
                x = 0
            }
            if y == rows {
                y = 0
            }
            count += status[y][x] ? 1 : 0
        }

        
        if !status[y][x]  {
            if count == 3 {
                return true
            }
            else {
                return false
            }
        }
        else {
            if count == 2 || count == 3 {
                return true
            }
            else {
                return false
            }
        }
    }
}

