//
//  ItemCollectionViewCell.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/27.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "ItemCollectionViewCell"
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(.mock_bread)
        return imageView
    }()

    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "제품명"
        label.textColor = .designSystem(.black1E1E1E)
        label.font = .designSystem(weight: .semiBold, size: ._17)
        return label
    }()
    
    private let itemDiscountPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "2000원"
        label.font = .designSystem(weight: .semiBold, size: ._13)
        label.textColor = .designSystem(.orangeE49318)
        return label
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "3000원"
        label.font = .designSystem(weight: .semiBold, size: ._13)
        label.textColor = .designSystem(.greyC8BCAB)
        return label
    }()
    
    private let slashLabel: UILabel = {
        let label = UILabel()
        label.text = "/"
        label.font = .designSystem(weight: .regular, size: ._17)
        label.textColor = .designSystem(.greyC8BCAB)
        return label
    }()
    
    private let itemAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .designSystem(weight: .regular, size: ._17)
        label.textColor = .designSystem(.greyC8BCAB)
        return label
    }()
    
    private let currentAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .designSystem(weight: .regular, size: ._17)
        label.textColor = .designSystem(.orangeE49318)
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.greyC8BCAB)
        return view
    }()
    
    private let minusButton: UIButton = {
       let button = UIButton()
        let minusImage = UIImage(systemName: "minus")
        button.setImage(minusImage, for: .normal)
        button.tintColor = .designSystem(.whiteF5F5F5)
        button.backgroundColor = .designSystem(.greyEAE5DF)
        button.layer.cornerRadius = DeviceInfo.screenWidth * 20 / 390 / 2
        return button
    }()
    
    private let plusButton: UIButton = {
       let button = UIButton()
        let minusImage = UIImage(systemName: "plus")
        button.setImage(minusImage, for: .normal)
        button.tintColor = .designSystem(.whiteF5F5F5)
        button.backgroundColor = .designSystem(.greyEAE5DF)
        button.layer.cornerRadius = DeviceInfo.screenWidth * 20 / 390 / 2
        return button
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

extension ItemCollectionViewCell {
    
    private func setUI() {
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 14
        contentView.clipsToBounds = true
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(itemTitleLabel)
        contentView.addSubview(itemDiscountPriceLabel)
        contentView.addSubview(itemPriceLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(minusButton)
        contentView.addSubview(plusButton)
        contentView.addSubview(itemAmountLabel)
        contentView.addSubview(slashLabel)
        contentView.addSubview(currentAmountLabel)
        
        itemImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(DeviceInfo.screenWidth * 84 / 390)
        }
        
        itemTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(itemImageView.snp.right).offset(DeviceInfo.horizontalPadding / 2)
            make.top.equalToSuperview().offset(DeviceInfo.screenHeight * 15 / 844)
        }
        
        itemDiscountPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(itemTitleLabel.snp.left)
            make.top.equalTo(itemTitleLabel.snp.bottom).offset(DeviceInfo.verticalPadding / 4)
        }
        
        itemPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(itemDiscountPriceLabel.snp.right).offset(DeviceInfo.horizontalPadding / 2)
            make.top.equalTo(itemDiscountPriceLabel.snp.top)
        }
        
        lineView.snp.makeConstraints { make in
            make.width.equalTo(itemPriceLabel.snp.width)
            make.height.equalTo(0.5)
            make.center.equalTo(itemPriceLabel.snp.center)
        }
        
        minusButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 20 / 390)
            make.centerY.equalTo(plusButton.snp.centerY)
            make.right.equalTo(plusButton.snp.left).offset(-DeviceInfo.screenWidth * 57 / 390)
        }
        
        slashLabel.snp.makeConstraints { make in
            make.centerY.equalTo(plusButton.snp.centerY)
            make.centerX.equalTo(DeviceInfo.screenWidth * 293.5 / 390)
        }
        
        itemAmountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(plusButton.snp.centerY)
            make.left.equalTo(slashLabel.snp.right)
        }
        
        currentAmountLabel.snp.makeConstraints { make in
            make.right.equalTo(slashLabel.snp.left)
            make.centerY.equalTo(plusButton.snp.centerY)
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 20 / 390)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-DeviceInfo.horizontalPadding)
        }
    }
    
    func configure(item: Item) {
        itemTitleLabel.text = item.itemName
        itemAmountLabel.text = "\(item.stock)"
        itemPriceLabel.text = "\(item.originPrice)"
        itemDiscountPriceLabel.text = "\(item.discountPrice)"
    }
    
    func configureImage(item: Item) {
        guard let url = URL(string: item.imgUrl) else { return }
        itemImageView.load(url: url)
    }
}
