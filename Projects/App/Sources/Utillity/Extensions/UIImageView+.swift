//
//  UIImageView+.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/16.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
