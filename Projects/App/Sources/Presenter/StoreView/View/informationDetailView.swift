//
//  informationDetailView.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/27.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import DesignSystem

class InformationDetailView: UIView {
    
    private let discountTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "할인 시간"
        label.textColor = .designSystem(.orangeE49318)
        label.font = .designSystem(weight: .semiBold, size: ._12)
        return label
    }()
    
    private let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "이벤트"
        label.textColor = .designSystem(.orangeE49318)
        label.font = .designSystem(weight: .semiBold, size: ._12)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .designSystem(weight: .regular, size: ._15)
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    let eventLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .designSystem(weight: .regular, size: ._15)
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    let timeDetailLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .designSystem(weight: .regular, size: ._13)
        label.textColor = .designSystem(.greyAFA08A)
        return label
    }()
    
    private let clockView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = DeviceInfo.screenWidth * 8 / 390
        view.backgroundColor = .designSystem(.orangeE49318)
        return view
    }()
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(.ic_clock)
        imageView.backgroundColor = .clear
        imageView.tintColor = .designSystem(.whiteF5F5F5)
        return imageView
    }()
    
    private let giftView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = DeviceInfo.screenWidth * 8 / 390
        view.backgroundColor = .designSystem(.orangeE49318)
        return view
    }()
    
    private let giftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(.ic_gift)
        imageView.backgroundColor = .clear
        imageView.tintColor = .designSystem(.whiteF5F5F5)
        return imageView
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.orangeE49318)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackground()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InformationDetailView {
    
    private func setBackground() {
        backgroundColor = .designSystem(.greyEAE5DF)
        layer.cornerRadius = 14
    }
    
    private func setUI() {
        
        addSubview(clockView)
        addSubview(lineView)
        addSubview(giftView)
        addSubview(discountTimeLabel)
        addSubview(eventTitleLabel)
        addSubview(eventLabel)
        addSubview(timeLabel)
        addSubview(timeDetailLabel)
        
        clockView.addSubview(clockImageView)
        giftView.addSubview(giftImageView)
        
        discountTimeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(DeviceInfo.verticalPadding)
            make.left.equalTo(giftView.snp.right).offset(DeviceInfo.horizontalPadding / 2)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(discountTimeLabel.snp.left)
            make.top.equalTo(discountTimeLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
        
        eventTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(discountTimeLabel.snp.left)
            make.top.equalTo(lineView.snp.bottom).offset(DeviceInfo.verticalPadding)
        }
        
        eventLabel.snp.makeConstraints { make in
            make.left.equalTo(eventTitleLabel.snp.left)
            make.top.equalTo(eventTitleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
        
        clockView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.top.equalToSuperview().inset(DeviceInfo.screenHeight * 32 / 844)
        }
        
        clockImageView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390 / 2)
            make.center.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(0.5)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(DeviceInfo.screenHeight * 94 / 844)
        }
        
        giftView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 21.5 / 844)
        }
        
        giftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390 / 2)
            make.center.equalToSuperview()
        }
        
        timeDetailLabel.snp.makeConstraints { make in
            make.left.equalTo(timeLabel.snp.left)
            make.top.equalTo(timeLabel.snp.bottom).offset(DeviceInfo.horizontalPadding / 4)
        }
    }
}
