//
//  ShoppingItemListView.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/30.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit

class ShoppingItemView: UIView {
    
    private let titleContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.greyEAE5DF)
        return view
    }()
    
    private let shoppingBagView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = DeviceInfo.screenWidth * 8 / 390
        view.backgroundColor = .designSystem(.greyC8BCAB)
        return view
    }()
    
    private let shoppingBagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(.ic_shoppingBag)
        imageView.backgroundColor = .clear
        imageView.tintColor = .designSystem(.whiteF5F5F5)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .semiBold, size: ._12)
        label.text = "담은 상품"
        label.textColor = .designSystem(.orangeE49318)
        return label
    }()
    
    private let itemCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0개"
        label.textColor = .designSystem(.black1E1E1E)
        label.font = .designSystem(weight: .regular, size: ._17)
        return label
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "9000원"
        label.textColor = .designSystem(.greyAFA08A)
        label.font = .designSystem(weight: .regular, size: ._13)
        return label
    }()
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super .init(frame: frame)
        setCornerRadious()
        setUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShoppingItemView {
    
    private func setCornerRadious() {
        clipsToBounds = true
        layer.cornerRadius = 14
        layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    private func setUI() {
        addSubview(titleContainerView)
        
        shoppingBagView.addSubview(shoppingBagImageView)
        
        titleContainerView.addSubview(shoppingBagView)
        titleContainerView.addSubview(titleLabel)
        titleContainerView.addSubview(itemCountLabel)
        titleContainerView.addSubview(totalPriceLabel)
        
        
        shoppingBagView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.left.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.top.equalToSuperview().inset(DeviceInfo.verticalPadding)
        }
        
        shoppingBagImageView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 15 / 390)
            make.center.equalToSuperview()
        }
        
        titleContainerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(DeviceInfo.screenHeight * 97 / 844)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(shoppingBagView.snp.right).offset(DeviceInfo.horizontalPadding / 2)
            make.top.equalTo(shoppingBagView.snp.top)
        }
        
        itemCountLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(itemCountLabel.snp.bottom).offset(DeviceInfo.screenHeight * 5 / 844)
        }
    }
}
