//
//  UIImage+.swift
//  DesignSystemTests
//
//  Created by YeongJin Jeong on 2022/11/27.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

public extension UIImage {
    convenience init?(_ asset: Asset) {
        self.init(named: asset.rawValue, in: Bundle.module, with: nil)
    }

    convenience init?(assetName: String) {
        self.init(named: assetName, in: Bundle.module, with: nil)
    }
    
    /// UIImage의 크기를 조정해줍니다.
    /// - Parameter size: 줄이고자하는 size
    /// - Returns: 줄여진 size의 UIImage
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
