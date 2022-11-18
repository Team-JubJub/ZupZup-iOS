//
//  HomeViewController.swift
//  AppTests
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit
import DesignSystem


class HomeViewController: BaseViewController {

    private var viewModel: HomeViewModel?
    
    weak var coordinator: Coordinator?

    // MARK: 왼쪽 상단 타이틀 라벨
    let titleLabel = ZupzupTitleLabel(title: "가게")
    
    // MARK: 화면 중앙 테이블 뷰
    let storeTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPink
        tableView.layer.cornerRadius = 18
        return tableView
    }()

    // MARK: Life_Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(storeTableView)
        layoutTitleLabel()
        layoutstoreTableView()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

extension HomeViewController {
    private func layoutTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(DeviceInfo.screenWidth * 0.04102)
            make.top.equalToSuperview().offset(DeviceInfo.screenHeight * 0.1105826397)
        }
    }
    private func layoutstoreTableView() {
        storeTableView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 0.9179487179)
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 0.1)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 0.08323424495)
        }
    }
}
