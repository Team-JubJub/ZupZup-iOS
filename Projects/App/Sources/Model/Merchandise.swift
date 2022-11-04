//
//  Merchandise.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

public struct Merchandise {

    let id: Int
    let name: String
    let sales: Int
    let imgUrl: String
    let price: Int

    public init(id: Int, name: String, sales: Int, imgUrl: String, price: Int) {
        self.id = id
        self.name = name
        self.sales = sales
        self.imgUrl = imgUrl
        self.price = price
    }
}
