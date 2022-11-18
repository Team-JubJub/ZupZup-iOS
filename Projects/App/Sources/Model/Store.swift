//
//  Store.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

// MARK: 매장
public struct Store {
    let id: Int
    let address: String
    let eventList: [String]
    let merchandiseList: [Item]
    let name: String
    let openTime: String
    let event: String
    
    public init(id: Int,
                address: String,
                eventList: [String],
                merchandiseList: [Item],
                name: String,
                openTime: String,
                event: String)
    {
        self.id = id
        self.address = address
        self.eventList = eventList
        self.merchandiseList = merchandiseList
        self.name = name
        self.openTime = openTime
        self.event = event
    }
}
