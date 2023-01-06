//
//  TabBarViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2023/01/06.
//  Copyright © 2023 ZupZup. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let horizentalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.orangeE49318)
        return view
    }()
    
    private let tabbarHeight = DeviceInfo.screenHeight * 84 / 844
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = tabbarHeight
        tabFrame.origin.y = self.view.frame.size.height - tabbarHeight
        self.tabBar.frame = tabFrame
    }
    
    private func setUI() {
        self.tabBar.addSubview(horizentalLine)
        
        horizentalLine.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
