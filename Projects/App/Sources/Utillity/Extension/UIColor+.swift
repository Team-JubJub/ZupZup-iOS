//
//  UIColor+.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/25.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

extension UIColor {
    class func designSystem(_ color: Palette) -> UIColor? {
        UIColor(named: color.rawValue)
    }
}
