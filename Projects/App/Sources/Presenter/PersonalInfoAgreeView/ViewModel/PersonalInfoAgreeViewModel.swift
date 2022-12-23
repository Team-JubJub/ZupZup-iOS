//
//  PersonalInfoAgreeViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/21.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

protocol PersonalInfoAgreeDelegate: AnyObject {
    func setPersonalAgree(isCompleted: Bool)
}

final class PersonalInfoAgreeViewModel {
    
    var coordinator: Coordinator
    
    weak var delegate: PersonalInfoAgreeDelegate?
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

// MARK:
extension PersonalInfoAgreeViewModel {
    func setAgree() {
        delegate?.setPersonalAgree(isCompleted: true)
    }
}

// MARK: Coordinating
extension PersonalInfoAgreeViewModel {
    func dismissViewController() {
        guard let coordinator = coordinator as? Dismissable else { return }
        coordinator.dismissViewController()
    }
}
