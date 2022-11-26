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

    private var viewModel: HomeViewModel
    
    weak var coordinator: Coordinator?

    // MARK: 왼쪽 상단 타이틀 라벨
    let titleLabel = ZupzupTitleLabel(title: "가게")
    
    // MARK: 화면 중앙 테이블 뷰
    let storeCollectionView: UICollectionView = {
        
        let cellWidth = DeviceInfo.screenWidth * 358 / 390
        let cellHeight = DeviceInfo.screenHeight * 127 / 844
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = DeviceInfo.screenHeight * 16 / 844
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(StoreCollectionViewCell.self, forCellWithReuseIdentifier: StoreCollectionViewCell.cellId)
        return collectionView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print(viewModel.stores.count)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life_Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(storeCollectionView)
        storeCollectionView.delegate = self
        storeCollectionView.dataSource = self
        layoutTitleLabel()
        layoutstoreTableView()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.cellId, for: indexPath) as? StoreCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
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
        storeCollectionView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 0.9179487179)
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 0.1)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 0.08323424495)
        }
    }
}
