//
//  UIColor+.swift
//  DesignSystem
//
//  Created by YeongJin Jeong on 2022/11/25.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

public extension UIColor {
    class func designSystem(_ color: Pallete) -> UIColor? {
        return UIColor(named: color.rawValue, in: Bundle.module, compatibleWith: nil)
    }
}

