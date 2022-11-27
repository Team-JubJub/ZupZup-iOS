//
//  Font.swift
//  ProjectDescriptionHelpers
//
//  Created by YeongJin Jeong on 2022/11/04.
//

import UIKit

public enum Font {
    public enum Name: String {
        case system
    }

    public enum Size: CGFloat {
        case _10 = 10
        case _13 = 13
        case _15 = 15
        case _17 = 17
        case _20 = 20
        case _34 = 34
    }

    public enum Weight: String {
        case heavy = "Heavy"
        case bold = "Bold"
        case semiBold = "semiBold"
        case medium = "Medium"
        case regular = "Regular"
        case light = "Light"

        public var real: UIFont.Weight {
            switch self {
            case .heavy:
                return .heavy

            case .bold:
                return .bold
                
            case .semiBold:
                return .semibold

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
