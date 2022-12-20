//
//  SetInfoViewModel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import RxSwift

protocol SetTimeDelegate: AnyObject {
    func setCurrentTime(currentTime: String)
}

final class SetTimeViewModel {
    
    weak var delegate: SetTimeDelegate?
    
    var coordinator: Coordinator
    
    var currentTime: String = ""
    
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

extension SetTimeViewModel {
    
    func setCurrentTime() {
        delegate?.setCurrentTime(currentTime: self.currentTime)
    }
    
    func getCurrentTime(currentTime: String) {
        self.currentTime = currentTime
    }
    
    func checkSetTimeButtonValidation(time: String) -> Bool {
        return !time.isEmpty
    }
}
