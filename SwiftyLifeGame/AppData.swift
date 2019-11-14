//
//  AppData.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/14.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import Foundation
import UIKit

class AppData {

    // Singleton Class
    static let shared = AppData()
    var cellColorIndex:Int = 0

    var cellColor:UIColor {
        get {
            return self.colors[cellColorIndex]
        }
    }
    
    let colors = [
        UIColor.systemPink,
        UIColor.systemGray,
        UIColor.systemBlue,
        UIColor.systemTeal,
        UIColor.systemIndigo,
        UIColor.systemGreen,
        UIColor.systemOrange,
        UIColor.systemPurple,
        UIColor.systemYellow,
        UIColor.systemRed,
        UIColor.label
    ]
    
    private init() {
    
    }
}
