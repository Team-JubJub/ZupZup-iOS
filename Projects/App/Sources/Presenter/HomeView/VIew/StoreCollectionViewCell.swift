//
//  StoreCollectionViewCell.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/24.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "StoreCollectionViewCell"
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = .designSystem(weight: .regular, size: ._13)
        label.textColor = .designSystem(.greyAFA08A)
        return label
    }()
    
    private let storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "가게명"
        label.font = .designSystem(weight: .bold, size: ._17)
        label.textColor = .designSystem(.black1E1E1E)
        return label
    }()
    
    private let discountPercentageLabel: UILabel = {
        let label = UILabel()
        label.text = "00%"
        label.font = .designSystem(weight: .bold, size: ._17)
        label.textColor = .designSystem(.orangeE49318)
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .designSystem(.greyAFA08A)
        return button
    }()
    
    private let clockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock")
        imageView.tintColor = .designSystem(.greyAFA08A)
        return imageView
    }()
    
    private let timeLable: UILabel = {
        let label = UILabel()
        label.text = "00:00 ~ 00:00"
        label.textColor = .designSystem(.greyAFA08A)
        return label
    }()
    
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoreCollectionViewCell {
    private func setUI() {
        
        contentView.backgroundColor = .designSystem(.greyEAE5DF)
        contentView.layer.cornerRadius = 14
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(storeNameLabel)
        contentView.addSubview(discountPercentageLabel)
        contentView.addSubview(nextButton)
        contentView.addSubview(clockImageView)
        contentView.addSubview(timeLable)
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(DeviceInfo.screenHeight * 16 / 844)
            make.left.equalToSuperview().inset(DeviceInfo.screenWidth * 16 / 390)
        }
        
        storeNameLabel.snp.makeConstraints { make in
            make.left.equalTo(categoryLabel.snp.left)
            make.top.equalTo(categoryLabel.snp.bottom).offset(4)
        }
        
        discountPercentageLabel.snp.makeConstraints { make in
            make.left.equalTo(storeNameLabel.snp.left)
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 16 / 844)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 24 / 390)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-DeviceInfo.screenWidth * 16 / 390)
        }
        
        clockImageView.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 15 / 390)
            make.centerY.equalTo(discountPercentageLabel.snp.centerY)
            make.left.equalTo(discountPercentageLabel.snp.right).offset(DeviceInfo.screenWidth * 34.5 / 390)
        }
        
        timeLable.snp.makeConstraints { make in
            make.left.equalTo(clockImageView.snp.right).offset(DeviceInfo.screenWidth * 6.5 / 390)
            make.centerY.equalTo(clockImageView.snp.centerY)
        }
    }
    
    func configure(
        category: String,
        storeName: String,
        time: String,
        discountPercentage: Int
    ) {
        self.categoryLabel.text = category
        self.storeNameLabel.text = storeName
        self.timeLable.text = time
        self.discountPercentageLabel.text = "\(discountPercentage)%"
    }
}
