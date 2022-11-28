//
//  ZupzupTitleButton.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/06.
//  Copyright © 2022 ZupZup. All rights reserved.
//
import UIKit


class ZupzupTitleLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.font = UIFont.designSystem(weight: .heavy, size: ._34)
        self.textAlignment = .left
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



