//
//  Pallete.swift
//  DesignSystem
//
//  Created by YeongJin Jeong on 2022/11/25.
//  Copyright © 2022 ZupZup. All rights reserved.
//

public enum Pallete: String {
    case whiteF5F5F5
    case orangeE49318
    case greyFFFDFA
    case greyF1EEE9
    case greyAFA08A
    case greyEAE5DF
    case greyC8BCAB
    case grey8C8C8C
    case black1E1E1E
    

    var hexString: String {
        switch self {
        case .whiteF5F5F5:
            return "#F5F5F5FF"
        case .orangeE49318:
            return "#E49318FF"
        case .greyFFFDFA:
            return "#FFFDFAFF"
        case .greyF1EEE9:
            return "#F1EEE9FF"
        case .greyAFA08A:
            return "#AFA08AFF"
        case .greyEAE5DF:
            return "#EAE5DFFF"
        case .greyC8BCAB:
            return "#C8BCABFF"
        case .grey8C8C8C:
            return "#8C8C8CFF"
        case .black1E1E1E:
            return "#1E1E1EFF"
        }
    }
}
