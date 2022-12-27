//
//  CartViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class ReservationCompletedViewModel {
    
    var coordinator: Coordinator
    
    let store: Store
    
    var items: [Item]
    
    let phoneNumber: String
    let visitor: String
    let visitTime: String
    
    init(
        coordinator: Coordinator,
        store: Store,
        items: [Item],
        phoneNumber: String,
        visitor: String,
        visitTime: String
    ) {
        self.coordinator = coordinator
        self.store = store
        self.items = items
        self.phoneNumber = phoneNumber
        self.visitor = visitor
        self.visitTime = visitTime
    }
}

extension ReservationCompletedViewModel {
    func setSelectedItems() {
        self.items = store.items.filter { $0.numOfSelected > 0 }
    }
    
    func setTotalPrice() -> Int {
        let totalPriceArray = items.map { $0.numOfSelected * $0.discountPrice }
        return totalPriceArray.reduce(0, +)
    }
    
    func setTotalNumOfItems() -> Int {
        return items.map { $0.numOfSelected }.reduce(0, +)
    }
    
    func setStoreTitle() -> String {
        return store.storeName
    }
    
    func setStoreAddress() -> String {
        return store.address
    }
}


// MARK: Coordinator
extension ReservationCompletedViewModel {
    func popToRootView() {
        guard let coordinator = coordinator as? PopToRoot else { return }
        coordinator.popToRootViewController()
    }
}
