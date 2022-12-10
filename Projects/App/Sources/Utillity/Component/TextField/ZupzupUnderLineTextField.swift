//
//  ZupzupUnderLineTextField.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/10.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit

class ZupzupUnderLineTextField: UITextField {
    
    lazy var placeHolderColor: UIColor = self.tintColor
    lazy var placeHolderString: String = ""
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.orangeE49318)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(underLineView)
        setClearButton(mode: .always)
        
        underLineView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.bottom)
        }
        
        
        self.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        self.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZupzupUnderLineTextField {
    func setPlaceholder(placeHolder: String, color: UIColor) {
            placeHolderColor = color

            self.attributedPlaceholder = NSAttributedString(
                string: placeHolder,
                attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor]
            )
            underLineView.backgroundColor = placeHolderColor
        }
    
    func setPlaceHolder() {
        self.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    
    @objc
    func editingDidBegin() {
        setPlaceHolder()
        underLineView.backgroundColor = self.tintColor
    }
    
    @objc
    func editingDidEnd() {
        underLineView.backgroundColor = placeHolderColor
    }
}
