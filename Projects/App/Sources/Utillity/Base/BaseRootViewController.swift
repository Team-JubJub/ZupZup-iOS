//
//  BaseRootViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2023/01/05.
//  Copyright © 2023 ZupZup. All rights reserved.
//

import UIKit

class BaseRootViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.interactivePopGestureRecognizer?.delegate = self      // Swipe-gesture를 통해 pop을 합니다.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
