//
//  MainCoordinator.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

import UIKit

struct MainCoordinatorConstants {
    struct Coordinator {
        static let home = "Home"
        static let myReservation = "MyReservation"
        
        static let homeIcon = "ic_home"
        static let myReservationIcon = "ic_shoppingCart"
    }
}

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    let tabBarController: UITabBarController
    let tabBarItems: [TabBarItem] = [ .home, .myReservation ]
    
    func start() {
        let controllers = tabBarItems.map { getTabController(item: $0) }
        prepareTabBarController(with: controllers)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    enum TabBarItem: CaseIterable {
        case home
        case myReservation
        
        var title: String {
            switch self {
            case .home:
                return MainCoordinatorConstants.Coordinator.home
            case .myReservation:
                return MainCoordinatorConstants.Coordinator.myReservation
            }
        }
        
        var tabBarIconName: String {
            switch self {
            case .home:
                return MainCoordinatorConstants.Coordinator.homeIcon
            case .myReservation:
                return MainCoordinatorConstants.Coordinator.myReservationIcon
            }
        }
        
        func getCoordinator(navigationController: UINavigationController) -> Coordinator {
            switch self {
            case .home:
                return HomeCoordinator(navigationController: navigationController)
            case .myReservation:
                return MyReservationCoordinator(navigationController: navigationController)
            }
        }
    }
}


// MARK: - Helper Methods
extension MainCoordinator {
    private func getTabController(item: TabBarItem) -> UINavigationController {
        let navigationController = UINavigationController()
        let imageSize = CGSize(width: 16, height: 18)
        let tabItem = UITabBarItem(
            title: nil,
            image: UIImage(assetName: item.tabBarIconName)?
                .resized(to: imageSize),
            selectedImage: nil
        )
        navigationController.tabBarItem = tabItem
        
        let coordinator = item.getCoordinator(navigationController: navigationController)
        coordinator.start()
        
        return navigationController
    }
    
    private func prepareTabBarController(with tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: false)
        navigationController.viewControllers = [tabBarController]
    }
}
