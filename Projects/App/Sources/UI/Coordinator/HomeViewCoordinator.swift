//
//  HomeViewCoordinator.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class HomeViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: StoreViewController로 전환
extension HomeViewCoordinator: StoreViewCoordinating {
    func pushStoreViewController() {
        let viewModel = StoreViewModel(coordinator: self)
        let viewController = StoreViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: ReservationViewController로 전환
extension HomeViewCoordinator: ReservationViewCoordinating {
    func pushReservationViewController() {
        let viewModel = ReservationViewModel(coordinator: self)
        let viewController = ReservationViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

