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

protocol PopToRoot {
    func popToRootViewController()
}

final class HomeCoordinator: Coordinator {
    
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
extension HomeCoordinator: StoreViewCoordinating {
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
extension HomeCoordinator: ReservationViewCoordinating {
    func pushReservationViewController(store: Store) {
        let viewModel = ReservationViewModel(coordinator: self, store: store)
        let viewController = ReservationViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: SetInfoViewController Present
extension HomeCoordinator: SetTimeViewCoordinating {
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

extension HomeCoordinator: SetInfoViewCoordinating {
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

extension HomeCoordinator: ReservationCompletedViewCoordinating {
    
    func pushReservationCompletedViewController(
        store: Store,
        items: [Item],
        customer: Customer
    ) {
        let viewModel = ReservationCompletedViewModel(
            coordinator: self,
            store: store,
            items: items,
            customer: customer
        )
        let viewController = ReservationCompletedViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension HomeCoordinator: PersonalInfoAgreeCoordinating {
    func presentPersonalInfoAgreeView(parentVC: ReservationViewController) {
        let viewModel = PersonalInfoAgreeViewModel(coordinator: self)
        viewModel.delegate = parentVC
        let viewController = PersonalInfoAgreeViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .pageSheet
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.large()]
        }
        navigationController.present(viewController, animated: true)
    }
}

extension HomeCoordinator: Popable {
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}

extension HomeCoordinator: Dismissable {
    func dismissViewController() {
        navigationController.dismiss(animated: true)
    }
}

extension HomeCoordinator: PopToRoot {
    func popToRootViewController() {
        navigationController.popToRootViewController(animated: true)
    }
}

