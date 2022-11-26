//
//  CartItem.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/18.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

// MARK: 상품_장바구니
public struct CartItem {
    let orderNumber: Int
    let itemId: Int
    let resId: Int
    let cartId: Int
    let userId: Int
    let count: Int
    
    public init(orderNumber: Int,
                itemId: Int,
                resId: Int,
                cartId: Int,
                userId: Int,
                count: Int)
    {
        self.orderNumber = orderNumber
        self.itemId = itemId
        self.resId = resId
        self.cartId = cartId
        self.userId = userId
        self.count = count
    }
    
    
}
