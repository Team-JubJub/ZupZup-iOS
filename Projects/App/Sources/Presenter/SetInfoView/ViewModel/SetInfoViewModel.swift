//
//  SetTimeViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

protocol SetInfoDelegate: AnyObject {
    func setUserInfo(name: String, PhoneNumber: String)
}

final class SetInfoViewModel {
    
    var coordinator: Coordinator
    
    weak var delegate: SetInfoDelegate?
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

// MARK: dismiss ViewController
extension SetInfoViewModel {
    func dismissViewController() {
        guard let coordinator = coordinator as? Dismissable else { return }
        coordinator.dismissViewController()
    }
}

extension SetInfoViewModel {
    func setUserInfo(name: String, PhoneNumber: String) {
        delegate?.setUserInfo(name: name, PhoneNumber: PhoneNumber)
    }
    
    func convertPhoneNumberFormat(text: String) -> String {
        switch text.count {
        case 13:
            return text.formated(by: "###-####-####")
        default:
            return text.formated(by: "###-###-####")
        }
    }
    
    func checkSetInfoButtonValidation(name: String, phoneNumber: String) -> Bool {
        return phoneNumber.hasValidPhoneNumber && !name.isEmpty
    }
}
