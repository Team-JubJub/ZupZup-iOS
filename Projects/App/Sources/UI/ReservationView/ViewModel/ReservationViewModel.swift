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

// MARK: Coordinator
extension ReservationViewModel {
    // MARK: 시간 설정 화면으로 전환
    func presentSetTimeView() {
        guard let coordinator = coordinator as? SetTimeViewCoordinating else { return }
        coordinator.presentSetTimeView()
    }
    // MARK: 정보 설정 화면으로 전환
    func presentSetInfoView() {
        guard let coordinator = coordinator as? SetInfoViewCoordinating else { return }
        coordinator.presentSetInfoView()
    }
}
