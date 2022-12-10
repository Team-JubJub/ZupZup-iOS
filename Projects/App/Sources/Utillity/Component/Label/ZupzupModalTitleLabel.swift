//
//  ZupzupModalTitleLabel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//
import UIKit

class ZupzupModalTitleLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.font = UIFont.designSystem(weight: .semiBold, size: ._17)
        self.textAlignment = .left
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
