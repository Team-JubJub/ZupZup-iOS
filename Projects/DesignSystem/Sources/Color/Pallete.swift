//
//  Pallete.swift
//  DesignSystem
//
//  Created by YeongJin Jeong on 2022/11/25.
//  Copyright © 2022 ZupZup. All rights reserved.
//

public enum Pallete: String {
    case greyAFA08A
    case black1E1E1E
    case greyEAE5DF
    case orangeE49318

    var hexString: String {
        switch self {
        case .greyAFA08A:
            return "#AFA08AFF"
        case .black1E1E1E:
            return "#1E1E1EFF"
        case .greyEAE5DF:
            return "#EAE5DFFF"
        case .orangeE49318:
            return "#E49318FF"
        }
    }
}
