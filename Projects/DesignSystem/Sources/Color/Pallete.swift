//
//  Pallete.swift
//  DesignSystem
//
//  Created by YeongJin Jeong on 2022/11/25.
//  Copyright © 2022 ZupZup. All rights reserved.
//

public enum Pallete: String {
    case orangeE49318
    case greyAFA08A
    case greyEAE5DF
    case greyC8BCAB
    case black1E1E1E
    

    var hexString: String {
        switch self {
        case .orangeE49318:
            return "#E49318FF"
        case .greyAFA08A:
            return "#AFA08AFF"
        case .greyEAE5DF:
            return "#EAE5DFFF"
        case .greyC8BCAB:
            return "#C8BCABFF"
        case .black1E1E1E:
            return "#1E1E1EFF"
        }
    }
}
