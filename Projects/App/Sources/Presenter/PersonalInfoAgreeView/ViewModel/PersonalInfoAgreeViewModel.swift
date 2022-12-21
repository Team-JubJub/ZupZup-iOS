//
//  PersonalInfoAgreeViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/21.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class PersonalInfoAgreeViewModel {
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

// MARK:
extension PersonalInfoAgreeViewModel {
    
}

// MARK: Coordinating
extension PersonalInfoAgreeViewModel {
    func dismissViewController() {
        guard let coordinator = coordinator as? Dismissable else { return }
        coordinator.dismissViewController()
    }
}
