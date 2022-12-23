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
    func pushStoreViewController(store: Store) {
        let viewModel = StoreViewModel(
            coordinator: self,
            store: store
        )
        let viewController = StoreViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: ReservationViewController로 전환
extension HomeViewCoordinator: ReservationViewCoordinating {
    func pushReservationViewController(store: Store) {
        let viewModel = ReservationViewModel(coordinator: self, store: store)
        let viewController = ReservationViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: SetInfoViewController Present
extension HomeViewCoordinator: SetTimeViewCoordinating {
    func presentSetTimeView(parentVC: ReservationViewController) {
        let viewModel = SetTimeViewModel(coordinator: self)
        viewModel.delegate = parentVC
        let viewController = SetTimeViewController(viewModel: viewModel)
        
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        navigationController.present(viewController, animated: true)
    }
}

extension HomeViewCoordinator: SetInfoViewCoordinating {
    func presentSetInfoView(parentVC: ReservationViewController) {
        let viewModel = SetInfoViewModel(coordinator: self)
        viewModel.delegate = parentVC
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

extension HomeViewCoordinator: PersonalInfoAgreeCoordinating {
    func presentPersonalInfoAgreeView(parentVC: ReservationViewController) {
        let viewModel = PersonalInfoAgreeViewModel(coordinator: self)
        let viewController = PersonalInfoAgreeViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.large()]
        }
        navigationController.present(viewController, animated: true)
    }
}
