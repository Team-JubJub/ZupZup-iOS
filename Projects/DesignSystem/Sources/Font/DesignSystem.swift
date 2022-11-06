//
//  DesignSystem.swift
//  ProjectDescriptionHelpers
//
//  Created by YeongJin Jeong on 2022/11/04.
//

import UIKit

enum Font {
    enum Name: String {
        case system
    }

    enum Size: CGFloat {
        case _10 = 10
        case _34 = 34
    }

    enum Weight: String {
        case heavy = "Heavy"
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
        case light = "Light"

        var real: UIFont.Weight {
            switch self {
            case .heavy:
                return .heavy

            case .bold:
                return .bold

            case .medium:
                return .medium

            case .regular:
                return .regular

            case .light:
                return .light
            }
        }
    }
}
