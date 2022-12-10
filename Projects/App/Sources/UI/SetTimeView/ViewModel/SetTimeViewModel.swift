//
//  SetInfoViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class SetTimeViewModel {
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

extension SetTimeViewModel {
    func dismissViewController() {
        guard let coordinator = coordinator as? Dismissable else { return }
        coordinator.dismissViewController()
    }
}
