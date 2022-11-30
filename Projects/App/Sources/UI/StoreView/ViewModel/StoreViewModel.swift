//
//  StoreViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class StoreViewModel {

    var coordinator: Coordinator
    
    var items = [Item]()
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        fetchData()
    }
}

extension StoreViewModel {
    private func fetchData() {
        let item = Item(itemId: 1,
                        storeId: 1,
                        itemName: "영진 라떼",
                        price: 2000,
                        discounted: 4000)
        
        for _ in 0...4 {
            items.append(item)
        }
    }
}

extension StoreViewModel {
    func pushReservationViewController() {
        guard let coordinator = coordinator as? ReservationViewCoordinating else { return }
        coordinator.pushReservationViewController()
    }
}

