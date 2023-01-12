//
//  MyReservationViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2023/01/05.
//  Copyright © 2023 ZupZup. All rights reserved.
//

import UIKit
import SnapKit

class MyReservationViewController: BaseRootViewController {
    
    private var viewModel: MyReservationViewModel
    
    let titleLabel = ZupzupTitleLabel(title: "내 예약")
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "내 예약 뷰"
        return label
    }()
    
    // MARK: Initializer
    init(viewModel: MyReservationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension MyReservationViewController {
    private func setUI() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
