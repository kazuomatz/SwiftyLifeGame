//
//  UITraitCollection+Darkmode.swift
//  SwiftyLifeGame
//
//  Created by Kazuo Matsunaga on 2019/11/15.
//  Copyright © 2019 kazuomatz. All rights reserved.
//

import Foundation
import UIKit
extension UITraitCollection {

    public static var isDarkMode: Bool {
        if #available(iOS 13, *), current.userInterfaceStyle == .dark {
            return true
        }
        return false
    }

}
