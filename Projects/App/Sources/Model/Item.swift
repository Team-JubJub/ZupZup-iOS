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
    let price: Int
    let discounted: Int
    
    public init(itemId: Int,
                storeId: Int,
                itemName: String,
                price: Int,
                discounted: Int)
    {
        self.itemId = itemId
        self.storeId = storeId
        self.itemName = itemName
        self.price = price
        self.discounted = discounted
    }
}
