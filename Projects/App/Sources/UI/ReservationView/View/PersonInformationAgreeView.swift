//
//  PersonInformationAgreeView.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/03.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class PersonInformationAgreeView: UIView {
    
    private let agreeLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보 이용 동의"
        label.textColor = .designSystem(.greyFFFDFA)
        label.font = .designSystem(weight: .semiBold, size: ._17)
        return label
    }()
    
    private let moreInformationButton: UIButton = {
        let button = UIButton()
        button.setTitle("자세히", for: .normal)
        button.tintColor = .designSystem(.greyFFFDFA)
        return button
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.tintColor = .designSystem(.black1E1E1E)
        button.layer.cornerRadius = (DeviceInfo.screenWidth * 40 / 390 / 2)
        button.backgroundColor = .designSystem(.whiteF5F5F5)
        return button
    }()
    
    
    // MARK: initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackGround()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonInformationAgreeView {
    
    private func setBackGround() {
        backgroundColor = .designSystem(.black1E1E1E)
        layer.cornerRadius = 14
    }
    
    private func setUI() {
        addSubview(agreeLabel)
        addSubview(moreInformationButton)
        addSubview(checkButton)
        
        agreeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
        
        checkButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 40 / 390)
            make.right.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.centerY.equalToSuperview()
        }
        
        moreInformationButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 28 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 13 / 844)
            make.centerY.equalToSuperview()
            make.right.equalTo(checkButton.snp.left).offset(DeviceInfo.horizontalPadding)
        }
    }
}
