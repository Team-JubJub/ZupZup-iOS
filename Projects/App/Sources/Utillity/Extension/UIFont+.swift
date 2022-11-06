//
//  UIFont+.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/06.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import DesignSystem

extension UIFont {
    class func designSystem(weight: DesignSystem.Font.Weight, size: DesignSystem.Font.Size) -> UIFont {
        .systemFont(ofSize: size.rawValue, weight: weight.real)
    }

    private static func _font(name: String, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }
}

