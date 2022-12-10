//
//  SetTimeViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class SetInfoViewController: BaseViewController {
    
    var viewModel: SetInfoViewModel
    
    private let dismissButton: ZupzupDismissButton = {
        let button = ZupzupDismissButton()
        button.layer.cornerRadius = DeviceInfo.screenWidth * 30 / 390 / 2
        return button
    }()
    
    // MARK: Initializer
    init(viewModel: SetInfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setUI()
        setButtonTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SetInfoViewController {
    
    private func setBackGround() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(dismissButton)
        
        dismissButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.right.equalToSuperview().inset(DeviceInfo.screenWidth * 14 / 390)
            make.top.equalToSuperview().inset(DeviceInfo.screenHeight * 45 / 844)
        }
    }
    
    private func setButtonTarget() {
        dismissButton.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
    }
    
    @objc
    func tapDismissButton() {
        viewModel.dismissViewController()
    }
}
