//
//  StoreInformationView.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/30.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class StoreInformationView: UIView {
    
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .designSystem(weight: .regular, size: ._17)
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    let storeAddressLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .designSystem(weight: .regular, size: ._13)
        label.textColor = .designSystem(.greyAFA08A)
        return label
        
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

extension StoreInformationView {
    func setUI() {
        addSubview(storeNameLabel)
        addSubview(storeAddressLabel)
        
        storeNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(DeviceInfo.horizontalPadding * 2)
            make.top.equalToSuperview().offset(DeviceInfo.horizontalPadding)
        }
        
        storeAddressLabel.snp.makeConstraints { make in
            make.left.equalTo(storeNameLabel.snp.left)
            make.top.equalTo(storeNameLabel.snp.bottom).offset(5)
        }
    }
    
    func setBackground() {
        backgroundColor = .designSystem(.greyEAE5DF)
    }
}
