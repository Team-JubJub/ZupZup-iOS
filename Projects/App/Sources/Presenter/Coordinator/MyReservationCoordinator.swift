//
//  MyReservationCoordinator.swift
//  App
//
//  Created by YeongJin Jeong on 2023/01/05.
//  Copyright © 2023 ZupZup. All rights reserved.
//

import UIKit

final class MyReservationCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MyReservationViewModel(coordinator: self)
        let viewController = MyReservationViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
