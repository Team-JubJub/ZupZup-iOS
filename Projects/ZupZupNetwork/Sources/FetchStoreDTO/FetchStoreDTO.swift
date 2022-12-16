//
//  FetchStoreDTO.swift
//  ZupZupNetwork
//
//  Created by YeongJin Jeong on 2022/12/15.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

public struct StoreDTO: Codable {
    
    @DocumentID var id: String?
    public var address: String
    public var eventList: [String]
    public var hostPhoneNumber: String
    public var latitude: Double
    public var longitude: Double
    public var merchandiseList: [Merchandise]
    public var name: String
    public var openTime: String
    public var saleTimeEnd: Int
    public var saleTimeStart: Int
    public var storeId: Int
    
    public struct Merchandise: Codable {
        public var discounted: Int
        public var imgUrl: String
        public var itemId: Int
        public var itemName: String
        public var price: Int
        public var stock: Int
        public var storeId: Int
    }
}
