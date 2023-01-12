//
//  ReservationViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import ZupZupNetwork

final class ReservationViewModel {
    
    var coordinator: Coordinator
    
    private let addReservationUseCase: AddReservationUseCase
    
    var items = [Item]()
    
    private let store: Store
    
    var customer = Customer()
    
    var isChecked: Bool = false
    
    init(coordinator: Coordinator,
         store: Store,
         addReservationUseCase: AddReservationUseCase = AddReservationUseCaseImpl()
    ) {
        self.coordinator = coordinator
        self.store = store
        self.addReservationUseCase = addReservationUseCase
        setSelectedItems()
    }
}

extension ReservationViewModel {
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
    
    func checkValidation() -> Bool {
        return !(customer.phoneNumber.isEmpty || customer.visitTime.isEmpty || !isChecked || customer.phoneNumber.isEmpty)
    }
    
    func addReservationToDB() {
        addReservationUseCase.addReservation(customer: customer, store: store, items: items) { result in
            switch result {
            case .success(let time):
                let shared = ReservationContainer.shared
                shared.appendReservation(time: time)
                self.pushReservationCompletedView()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: Coordinator
extension ReservationViewModel {
    // MARK: 시간 설정 화면으로 전환
    func presentSetTimeView(parentVC: ReservationViewController) {
        guard let coordinator = coordinator as? SetTimeViewCoordinating else { return }
        coordinator.presentSetTimeView(parentVC: parentVC)
    }
    // MARK: 정보 설정 화면으로 전환
    func presentSetInfoView(parentVC: ReservationViewController) {
        guard let coordinator = coordinator as? SetInfoViewCoordinating else { return }
        coordinator.presentSetInfoView(parentVC: parentVC)
    }
    
    func presentPersonalInfoAgreeView(parentVC: ReservationViewController) {
        guard let coordinator = coordinator as? PersonalInfoAgreeCoordinating else { return }
        coordinator.presentPersonalInfoAgreeView(parentVC: parentVC)
    }
    
    func pushReservationCompletedView() {
        guard let coordinator = coordinator as? ReservationCompletedViewCoordinating else { return }
        coordinator.pushReservationCompletedViewController(store: store,
                                                           items: items,
                                                           customer: customer
        )
    }
}
