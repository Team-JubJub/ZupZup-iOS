//
//  SetTimeViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class SetTimeViewController: BaseViewController {
    
    private var viewModel: SetTimeViewModel
    
    // MARK: Initializer
    init(viewModel: SetTimeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var coordinator: Coordinator?

}
