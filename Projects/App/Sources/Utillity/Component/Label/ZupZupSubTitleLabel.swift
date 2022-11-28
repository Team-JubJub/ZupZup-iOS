//
//  ZupZupSubTitleLabel.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/27.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class ZupzupSubTitleLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.textColor = .designSystem(.black1E1E1E)
        self.font = UIFont.designSystem(weight: .semiBold, size: ._20)
        self.textAlignment = .left
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
