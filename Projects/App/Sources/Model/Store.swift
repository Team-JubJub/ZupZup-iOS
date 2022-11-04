//
//  Store.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

public struct Store {
    let id: Int
    let headerInfo: HeaderInfo
    let address: String
    let eventList: [String]
    let merchandiseList: [Merchandise]

    public init(id: Int,
                headerInfo: HeaderInfo,
                address: String,
                eventList: [String],
                merchandiseList: [Merchandise]
    ) {
        self.id = id
        self.headerInfo = headerInfo
        self.address = address
        self.eventList = eventList
        self.merchandiseList = merchandiseList
    }
}
