//
//  ItemListTableViewCell.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/30.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
    
    static let identifier = "ItemListTableView"
    
    lazy var itemTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .regular, size: ._15)
        label.textColor = .designSystem(.greyAFA08A)
        label.text = "제품명 1"
        return label
    }()
    
    lazy var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .regular, size: ._15)
        label.textColor = .designSystem(.greyAFA08A)
        label.text = "3000원"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemListTableViewCell {
    private func setUI() {
        backgroundColor = .designSystem(.greyF1EEE9)
        contentView.addSubview(itemTitleLabel)
        contentView.addSubview(itemPriceLabel)
        
        itemTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(DeviceInfo.screenWidth * 58 / 390)
            make.centerY.equalToSuperview()
        }
        
        itemPriceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(DeviceInfo.verticalPadding)
            make.centerY.equalToSuperview()
        }
    }
}
