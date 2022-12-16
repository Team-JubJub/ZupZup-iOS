//
//  Merchandise.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

// MARK: 상품
public struct Item {
    let itemId: Int
    let storeId: Int
    let itemName: String
    let imgUrl: String
    let originPrice: Int
    let discountPrice: Int
    let stock: Int
    
    public init(
        itemId: Int,
        storeId: Int,
        itemName: String,
        imgUrl: String,
        originPrice: Int,
        discountPrice: Int,
        stock: Int
    ) {
        self.itemId = itemId
        self.storeId = storeId
        self.itemName = itemName
        self.imgUrl = imgUrl
        self.originPrice = originPrice
        self.discountPrice = discountPrice
        self.stock = stock
    }
}
