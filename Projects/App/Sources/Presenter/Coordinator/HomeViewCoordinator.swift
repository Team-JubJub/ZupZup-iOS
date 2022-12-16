//
//  HomeViewCoordinator.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

protocol Popable {
    func popViewController()
}

protocol Dismissable {
    func dismissViewController()
}

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
    func pushReservationViewController(items: [Item]) {
        let viewModel = ReservationViewModel(coordinator: self, items: items)
        let viewController = ReservationViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: SetInfoViewController Present
extension HomeViewCoordinator: SetTimeViewCoordinating {
    func presentSetTimeView() {
        let viewModel = SetTimeViewModel(coordinator: self)
        let viewController = SetTimeViewController(viewModel: viewModel)
        
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        navigationController.present(viewController, animated: true)
    }
}

extension HomeViewCoordinator: SetInfoViewCoordinating {
    func presentSetInfoView() {
        let viewModel = SetInfoViewModel(coordinator: self)
        let viewController = SetInfoViewController(viewModel: viewModel)
        
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.large()]
        }
        navigationController.present(viewController, animated: true)
    }
}

extension HomeViewCoordinator: Popable {
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}

extension HomeViewCoordinator: Dismissable {
    func dismissViewController() {
        navigationController.dismiss(animated: true)
    }
}
