//
//  ShoppingBasketViewController.swift
//  AppTests
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit
import DesignSystem

class CartView: BaseViewController {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: DeviceInfo.screenWidth,
                                  height: DeviceInfo.screenHeight)
        scrollView.isScrollEnabled = true
        scrollView.contentSize.height = DeviceInfo.screenHeight * 3
        return scrollView
    }()

    private var helloBox: UIView = {

        let view = UIView()
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: DeviceInfo.screenWidth, height: DeviceInfo.screenHeight * 3)
        return view
    }()

    private let locationLabel2: UILabel = {
        var label = UILabel()
        label.text = "가게위치"
        label.font = UIFont.systemFont(ofSize: 17)
        label.frame = CGRect(x: 0, y: 0, width: 63, height: 22)
        return label
    }()


    private let locationLabel: UILabel = {
        var label = UILabel()
        label.text = "가게위치"
        label.font = UIFont.systemFont(ofSize: 17)
        label.frame = CGRect(x: 0, y: 0, width: 63, height: 22)
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)

        scrollView.addSubview(locationLabel)
        scrollView.addSubview(locationLabel2)
        scrollView.addSubview(helloBox)

        scrollView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
            make.edges.equalToSuperview()
        }

        locationLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        locationLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).multipliedBy(2)
        }
    }
}


