//
//  AppCoordinator.swift
//  App
//
//  Created by YeongJin Jeong on 2023/01/05.
//  Copyright © 2023 ZupZup. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window

        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: true)
        self.navigationController = navigationController
    }

    func start() {
        window.rootViewController = navigationController
        
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.start()

        window.makeKeyAndVisible()
    }
}
