//
//  AddReservationDTO.swift
//  ZupZupNetworkTests
//
//  Created by YeongJin Jeong on 2022/12/23.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

public struct AddReservationDTO: Codable {
    @DocumentID var id: String?
    public var customerName: String
    public var customerPhone: String
    public var state: String
    public var storeId: Int
    public var visitTime: Int
    public var reserveId: Int
    public var cartList: [CartDTO]
    
    public struct CartDTO: Codable {
        public var itemId: Int
        public var storeId: Int
        public var amount: Int
        public var name: String
        public var salesPrice: Int
        
        public init(itemId: Int, storeId: Int, amount: Int, name: String, salesPrice: Int) {
            self.itemId = itemId
            self.storeId = storeId
            self.amount = amount
            self.name = name
            self.salesPrice = salesPrice
        }
    }
    
    public init(id: String? = nil,
                customerName: String,
                customerPhone: String,
                state: String,
                storeId: Int,
                visitTime: Int,
                reserveId: Int,
                cartList: [CartDTO]
    ) {
        self.id = id
        self.customerName = customerName
        self.customerPhone = customerPhone
        self.state = state
        self.storeId = storeId
        self.visitTime = visitTime
        self.reserveId = reserveId
        self.cartList = cartList
    }
}
