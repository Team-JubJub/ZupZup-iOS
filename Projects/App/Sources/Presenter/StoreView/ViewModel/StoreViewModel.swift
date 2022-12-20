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
    
    var store: Store
    
    init(
        coordinator: Coordinator,
        store: Store
    ) {
        self.coordinator = coordinator
        self.store = store
    }
}

extension StoreViewModel {
    func isNextButtonEnable() -> Bool {
        return !store.items.filter {return $0.numOfSelected > 0}.isEmpty
    }
}

extension StoreViewModel {
    func pushReservationViewController(items: [Item]) {
        guard let coordinator = coordinator as? ReservationViewCoordinating else { return }
        coordinator.pushReservationViewController(items: items)
    }
}

