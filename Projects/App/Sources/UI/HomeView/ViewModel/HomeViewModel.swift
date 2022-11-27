//
//  Ho.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/06.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class HomeViewModel {
    
    var coordinator: Coordinator
    
    var stores = [Store]()
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        fetchData()
    }
}

extension HomeViewModel {
    private func fetchData() {
        let item = Item(itemId: 1,
                        storeId: 1,
                        itemName: "영진 라뗴",
                        price: 5000,
                        discounted: 4000)
        
        let store = Store(id: 1,
                          address: "부산광역시 장전동 123-48 1층",
                          eventList: ["event", "event", "event"],
                          merchandiseList: [item, item, item],
                          name: "영진 상회",
                          openTime: "09:00",
                          event: "event")
        
        for _ in 0...3 {
            self.stores.append(store)
        }
    }
}

extension HomeViewModel {
    func pushStoreViewController() {
        guard let coordinator = coordinator as? StoreViewCoordinating else { return }
        coordinator.pushStoreViewController()
    }
}
