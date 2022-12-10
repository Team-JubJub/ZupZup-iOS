//
//  UITextField+.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/10.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit

extension UITextField {
    func setClearButton(mode: UITextField.ViewMode) {
        let configure = UIImage.SymbolConfiguration(pointSize: 7.5, weight: .heavy)
        let clearButton = UIButton(type: .custom)
        
        clearButton.setImage(
            UIImage(systemName: "xmark", withConfiguration: configure),
            for: .normal
        )
        
        clearButton.layer.borderWidth = 2
        clearButton.layer.borderColor = UIColor.designSystem(.orangeE49318)?.cgColor
        clearButton.layer.cornerRadius = 7.5
        
        clearButton.addTarget(
            self,
            action: #selector(UITextField.clear(sender:)),
            for: .touchUpInside
        )
        
        self.rightView = clearButton
        self.rightViewMode = mode
        
        clearButton.snp.makeConstraints { make in
            make.height.width.equalTo(15)
        }
    }
    @objc
    private func clear(sender: AnyObject) {
        self.text = ""
    }
}
