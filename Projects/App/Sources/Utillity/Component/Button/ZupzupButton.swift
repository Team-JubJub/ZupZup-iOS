//
//  ZupzupButton.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/28.
//  Copyright © 2022 ZupZup. All rights reserved.
//
import UIKit

class ZupzupButton: UIButton {
    
    var isButtonSelected: Bool = false {
        didSet {
            switch isButtonSelected {
            case true:
                self.backgroundColor = .designSystem(.orangeE49318)
                self.setTitleColor(.designSystem(.black1E1E1E), for: .normal)
                self.isEnabled = true
            case false:
                self.backgroundColor = .designSystem(.greyEAE5DF)
                self.setTitleColor(.designSystem(.grey8C8C8C), for: .normal)
                self.isEnabled = false
            }
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .designSystem(weight: .semiBold, size: ._17)
        self.layer.cornerRadius = 14
        self.backgroundColor = .designSystem(.greyEAE5DF)
        self.setTitleColor(.designSystem(.grey8C8C8C), for: .normal)
        self.isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
