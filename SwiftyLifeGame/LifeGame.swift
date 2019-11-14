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
    
    internal let columns = 20
    internal let rows = 30
    
    var status = [[Bool]]()
    
    // Singleton Class
    static let shared = LifeGame()
    
    private init() {
        randamize()
    }
    
    // Set cell state randomly
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
    
    // Set cell state false
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

    // Check status of all cells
    public func checkLife() -> Int  {
        var newStatus = [[Bool]]()
        var count:Int = 0
        for row in 0 ..< rows {
            var rows = [Bool]()
            for column  in 0 ..< columns {
                let status = checkCell(point:CGPoint(x: column, y: row))
                rows.append(status)
                if status {
                    count += 1
                }
            }
            newStatus.append(rows)
        }
        self.status = newStatus
        return count
    }
    
    public func setStatus(index:Int, status:Bool) {
        let x = index % LifeGame.shared.columns
        let y = index / LifeGame.shared.columns
        self.status[y][x] = status
    }
    
    public func setStatus(point: CGPoint, status:Bool) {
        let x = Int(point.x)
        let y = Int(point.y)
        self.status[y][x] = status
    }
    
    public func getStatus(index: Int) -> Bool {
        let x = index % LifeGame.shared.columns
        let y = index / LifeGame.shared.columns
        return self.status[y][x]
    }
    
    public func setOscillator(oscillator: Oscillator, at: CGPoint) {
        oscillator.cells.forEach {
            let point = $0
            self.setStatus(point: CGPoint(x: at.x + point.x, y: at.y + point.y), status: true)
        }
    }

    public func setOscillator(oscillator: Oscillator) {
        let width = Int(oscillator.size.width)
        let height = Int(oscillator.size.height)
        
        let x = self.columns / 2 - width / 2
        let y = self.rows / 2 - height / 2
        self.setOscillator(oscillator: oscillator, at: CGPoint(x: x, y: y))
    }
    
    // Count living cells around
    internal func countNeighbors(x:Int, y:Int) -> Int {
        
        let points = [
            CGPoint(x: x - 1 , y: y - 1),
            CGPoint(x: x - 1 , y: y),
            CGPoint(x: x - 1 , y: y + 1),

            CGPoint(x: x , y: y - 1),
            CGPoint(x: x , y: y + 1),

            CGPoint(x: x + 1 , y: y - 1),
            CGPoint(x: x + 1 , y: y),
            CGPoint(x: x + 1 , y: y + 1),
            ]

        var count:Int = 0

        points.forEach {
            let point = $0
            var x = Int(point.x)
            var y = Int(point.y)
            
            if x < 0 {
                x = columns - 1
            }
            else if x == columns {
                x = 0
            }
            
            if y < 0 {
                y = rows - 1
            }
            else if y == rows {
                y = 0
            }
            count += status[y][x] ? 1 : 0
        }
        return count
    }
    
    // Check state of cell
    internal func checkCell(point: CGPoint) -> Bool {
        
        let x = Int(point.x)
        let y = Int(point.y)
        
        let count = countNeighbors(x: x, y: y)

        if !status[y][x]  {
            if count == 3 {
                //change to live
                return true
            }
            else {
                //under population
                return false
            }
        }
        else {
            if count == 2 || count == 3 {
                //lives on to the next generation
                return true
            }
            else {
                //over population or under population
                return false
            }
        }
    }
}

