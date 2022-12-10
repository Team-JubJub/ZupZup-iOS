//
//  ZupzupDismissButton.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class ZupzupDismissButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(systemName: "xmark"), for: .normal)
        backgroundColor = .designSystem(.orangeE49318)
        tintColor = .designSystem(.whiteF5F5F5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
