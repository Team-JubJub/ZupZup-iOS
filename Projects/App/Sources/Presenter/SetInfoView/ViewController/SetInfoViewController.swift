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
    
    private let titleLabel = ZupzupModalTitleLabel(title: "개인 정보")
    
    private let setInfoButton = ZupzupButton(title: "개인정보 입력하기")
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.font = .designSystem(weight: .semiBold, size: ._20)
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.font = .designSystem(weight: .semiBold, size: ._20)
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    private let nameTextField: ZupzupUnderLineTextField = {
        let textField = ZupzupUnderLineTextField()
        textField.borderStyle = .none
        textField.tintColor = .designSystem(.orangeE49318)
        textField.textColor = .designSystem(.black1E1E1E)
        textField.setPlaceholder(placeHolder: "이름을 입력하세요", color: .designSystem(.greyEAE5DF) ?? .white)
        return textField
    }()
    
    private let phoneNumberTextField: ZupzupUnderLineTextField = {
        let textField = ZupzupUnderLineTextField()
        textField.borderStyle = .none
        textField.tintColor = .designSystem(.orangeE49318)
        textField.textColor = .designSystem(.black1E1E1E)
        textField.setPlaceholder(placeHolder: "전화번호를 입력하세요", color: .designSystem(.greyEAE5DF) ?? .white)
        return textField
        
    }()
    
    // MARK: Initializer
    init(viewModel: SetInfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButtonTarget()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension SetInfoViewController {
    
    private func setBackGround() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(dismissButton)
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(nameTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(setInfoButton)
        
        dismissButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.right.equalToSuperview().inset(DeviceInfo.verticalPadding)
            make.top.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dismissButton.snp.centerY)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 37 / 844)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 44 / 844)
            make.top.equalTo(nameLabel.snp.bottom).offset(DeviceInfo.verticalPadding)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameTextField.snp.bottom).offset(DeviceInfo.screenHeight * 56 / 844)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 44 / 844)
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(DeviceInfo.verticalPadding)
        }
        
        setInfoButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 57 / 844)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 34 / 844)
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
