//
//  Cart.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

// MARK: 장바구니
public struct Cart {
    let cartId: Int
    let userId: Int
    let amount: Int
    let arriveTime: String
    let cartList: [CartItem]
    let contact: String
    let name: String
}
