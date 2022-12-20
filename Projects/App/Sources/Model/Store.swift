//
//  Store.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: 매장
public struct Store {
    let storeId: Int
    let category: String
    let storeName: String
    let openTime: String
    let discountPercent: Int
    let discountTime: String
    let address: String
    let location: CLLocationCoordinate2D
    var items: [Item]
    let eventList: [String]
    
    public init(
        storeId: Int,
        category: String,
        storeName: String,
        openTime: String,
        discountPercent: Int,
        discountTime: String,
        address: String,
        location: CLLocationCoordinate2D,
        items: [Item],
        eventList: [String]
    ) {
        self.storeId = storeId
        self.category = category
        self.storeName = storeName
        self.openTime = openTime
        self.discountPercent = discountPercent
        self.discountTime = discountTime
        self.address = address
        self.location = location
        self.items = items
        self.eventList = eventList
    }
}
