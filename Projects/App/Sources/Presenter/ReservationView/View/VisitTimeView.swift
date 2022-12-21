//
//  VisitTimeView.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/01.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class VisitTimeView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .semiBold, size: ._12)
        label.text = "방문 예정 시간"
        label.textColor = .designSystem(.orangeE49318)
        return label
    }()
    
    private let clockView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = DeviceInfo.screenWidth * 8 / 390
        view.backgroundColor = .designSystem(.greyC8BCAB)
        return view
    }()
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(.ic_clock)
        imageView.backgroundColor = .clear
        imageView.tintColor = .designSystem(.whiteF5F5F5)
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .regular, size: ._17)
        label.text = "시간을 입력하세요"
        label.textColor = .designSystem(.black1E1E1E)
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

extension VisitTimeView {
    private func setUI() {
        backgroundColor = .designSystem(.greyEAE5DF)
        layer.cornerRadius = 14
        
        addSubview(clockView)
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(rightChevronImageView)
        
        clockView.addSubview(clockImageView)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(clockView.snp.right).offset(DeviceInfo.horizontalPadding / 2)
            make.top.equalTo(clockView.snp.top)
        }
        
        clockView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.top.equalToSuperview().inset(DeviceInfo.verticalPadding)
        }
        
        clockImageView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 15 / 390)
            make.center.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
        
        rightChevronImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(DeviceInfo.screenWidth * 24 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 24 / 844)
            make.right.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
    }
}
