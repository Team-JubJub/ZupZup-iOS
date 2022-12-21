//
//  PersonalInfoAgreeViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/21.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class PersonalInfoAgreeViewController: BaseViewController {
    
    var viewModel: PersonalInfoAgreeViewModel
    
    // MARK: Initialize
    init(viewModel: PersonalInfoAgreeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        setUI()
    }
}

extension PersonalInfoAgreeViewController {
    
    private func setBackGround() {
        view.backgroundColor = .white
        view.layer.cornerRadius = DeviceInfo.screenWidth * 15 / 390
    }
    
    private func setUI() {
        
    }
}
