//
//  ReservationViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class ReservationViewModel {

    var coordinator: Coordinator
    
    var items = [Item]()
    
    init(coordinator: Coordinator, items: [Item]) {
        self.items = items
        self.coordinator = coordinator
    }
}

extension ReservationViewModel {
    func presentSetTimeView() {
        guard let coordinator = coordinator as? SetInfoViewCoordinating else { return }
        coordinator.presentSetTimeView()
    }
}
