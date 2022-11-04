//
//  HeaderInfo.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

public struct HeaderInfo {
    let name: String
    let openTime: String
    let maximumSales: Int

    public init(name: String, openTime: String, maximumSales: Int) {
        self.name = name
        self.openTime = openTime
        self.maximumSales = maximumSales
    }
}
