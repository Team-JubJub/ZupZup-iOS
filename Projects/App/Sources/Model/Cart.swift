//
//  Cart.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

public struct Cart {
    let id: Int
    let imgUrl: String
    let name: String
    let salesPrice: Int
    let amount: Int

    public init(id: Int, imgUrl: String, name: String, salesPrice: Int, amount: Int) {
        self.id = id
        self.imgUrl = imgUrl
        self.name = name
        self.salesPrice = salesPrice
        self.amount = amount
    }
}
