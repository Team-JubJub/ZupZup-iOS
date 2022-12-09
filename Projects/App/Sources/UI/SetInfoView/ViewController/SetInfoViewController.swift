//
//  SetInfoViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class SetInfoViewController: BaseViewController {
    
    private var viewModel: SetInfoViewModel
    
    private let dismissButton: ZupzupDismissButton = {
        let button = ZupzupDismissButton()
        button.layer.cornerRadius = DeviceInfo.screenWidth * 30 / 390 / 2
        return button
    }()
    
    private let setTimeButton = ZupzupButton(title: "시간 정하기")
    
    // MARK: Initializer
    init(viewModel: SetInfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SetInfoViewController {
    private func setUI() {
        view.addSubview(dismissButton)
        view.addSubview(setTimeButton)
        
        dismissButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.right.equalToSuperview().inset(DeviceInfo.screenWidth * 14 / 390)
            make.top.equalToSuperview().inset(DeviceInfo.screenHeight * 17 / 844)
        }
        
        setTimeButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 57 / 844)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 34 / 844)
        }
    }
}
