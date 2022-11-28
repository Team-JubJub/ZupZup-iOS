//
//  UIImage+.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/27.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

extension UIImage {
    /// UIImage의 크기를 조정해줍니다.
    /// - Parameter size: 줄이고자하는 size
    /// - Returns: 줄여진 size의 UIImage
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

