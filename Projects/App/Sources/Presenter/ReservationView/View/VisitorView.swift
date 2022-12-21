//
//  visitorView.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/03.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .semiBold, size: ._12)
        label.text = "방문자"
        label.textColor = .designSystem(.orangeE49318)
        return label
    }()
    
    private let homeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = DeviceInfo.screenWidth * 8 / 390
        view.backgroundColor = .designSystem(.greyC8BCAB)
        return view
    }()
    
    private let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(.ic_home)
        imageView.backgroundColor = .clear
        imageView.tintColor = .designSystem(.whiteF5F5F5)
        return imageView
    }()
    
    let visitorLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .regular, size: ._17)
        label.text = "이름을 입력하세요"
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .regular, size: ._13)
        label.text = "전화번호를 입력하세요"
        label.textColor = .designSystem(.greyAFA08A)
        return label
    }()
    
    private let rightChevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .designSystem(.greyAFA08A)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VisitorView {
    private func setUI() {
        backgroundColor = .designSystem(.greyEAE5DF)
        layer.cornerRadius = 14
        
        addSubview(homeView)
        addSubview(titleLabel)
        addSubview(visitorLabel)
        addSubview(phoneNumberLabel)
        addSubview(rightChevronImageView)
        
        homeView.addSubview(homeImageView)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(homeView.snp.right).offset(DeviceInfo.horizontalPadding / 2)
            make.top.equalTo(homeView.snp.top)
        }
        
        homeView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.top.equalToSuperview().inset(DeviceInfo.verticalPadding)
        }
        
        homeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 15 / 390)
            make.center.equalToSuperview()
        }
        
        visitorLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(visitorLabel.snp.left)
            make.top.equalTo(visitorLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
        
        rightChevronImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalTo(DeviceInfo.screenWidth * 24 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 24 / 844)
            make.right.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
    }
}
