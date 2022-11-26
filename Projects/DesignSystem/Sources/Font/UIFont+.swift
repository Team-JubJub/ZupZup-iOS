//
//  UIFont+.swift
//  DesignSystem
//
//  Created by YeongJin Jeong on 2022/11/25.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

extension UIFont {
    public class func designSystem(weight: Font.Weight, size: Font.Size) -> UIFont {
        return .systemFont(ofSize: size.rawValue, weight: weight.real)
    }
    private static func _font(name: String, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }
}
