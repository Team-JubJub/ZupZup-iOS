//
//  MockUps.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/06.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

#if DEBUG
// Item
let firstItem = Item(itemId: 1, storeId: 1, itemName: "영진빵", price: 2000, discounted: 1800)

let secondItem = Item(itemId: 2, storeId: 1, itemName: "준영빵", price: 1500, discounted: 1300)

let thirdItem = Item(itemId: 3, storeId: 1, itemName: "지우빵", price: 5000, discounted: 4000)

// CartItem
let firstCartItem = CartItem(orderNumber: 1,
                             itemId: 1,
                             resId: 1,
                             cartId: 1,
                             userId: 1,
                             count: 1)

let secondCartItem = CartItem(orderNumber: 2,
                              itemId: 1,
                              resId: 1,
                              cartId: 1,
                              userId: 1,
                              count: 1)

let thirdCartItem = CartItem(orderNumber: 3,
                             itemId: 1,
                             resId: 1,
                             cartId: 1,
                             userId: 1,
                             count: 1)

// Cart
let mockCart = Cart(cartId: 1,
                    userId: 1,
                    amount: 1,
                    arriveTime: "6시 30분",
                    cartList:
                        [
                            firstCartItem,
                            secondCartItem,
                            thirdCartItem
                        ],
                    contact: "농협 123232-3232-423232",
                    name: "정영진")

// Reservation

let mockResrvation = Reservation(resId: 1,
                                 storeId: 1,
                                 userId: 1,
                                 reservationTime: "6시 30분",
                                 sales: "호빵",
                                 cartList: [mockCart,
                                            mockCart,
                                            mockCart
                                 ],
                                 visitTime: "7시",
                                 state: .Cancel)
#endif
