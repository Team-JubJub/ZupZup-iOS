//
//  StoreViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class StoreViewController: BaseViewController {
    
    private var viewModel: StoreViewModel
    
    private let itemCollectionView: UICollectionView = {
        let cellWidth = DeviceInfo.screenWidth * 358 / 390
        let cellHeight = DeviceInfo.screenHeight * 73 / 844
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = DeviceInfo.verticalPadding / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled  = false
        collectionView.backgroundColor = .clear
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.cellId)
        return collectionView
    }()
    
    private let reservationButton: ZupzupButton = {
        let button = ZupzupButton(title: "예약하기")
        button.addTarget(self , action: #selector(didReservationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel = ZupzupTitleLabel(title: "영진상회")
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = 14
        map.setRegion(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 35.22790613649247,
                    longitude: 129.0843880607427
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            ),
            animated: true
        )
        return map
    }()
    
    private let informationLabel = ZupzupSubTitleLabel(title: "정보")
    
    private let itemTitleLabel = ZupzupSubTitleLabel(title: "상품")
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .designSystem(.greyC8BCAB)
        label.text = "부산광역시 장전동 123-48 1층"
        label.font = .designSystem(weight: .regular, size: ._15)
        return label
    }()
    
    private let informationView = informationDetailView()
    
    private let StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = DeviceInfo.verticalPadding
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    // MARK: Initializer
    init(viewModel: StoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LIFE - Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .designSystem(.orangeE49318)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// MARK: UICollectionView Delegate, DataSource
extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.cellId, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension StoreViewController {
    // MARK: UI
    func setUI() {
        
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        
        view.addSubview(titleLabel)
        view.addSubview(addressLabel)
        view.addSubview(scrollView)
        view.addSubview(reservationButton)
        
        scrollView.addSubview(StackView)
        StackView.addArrangedSubview(mapView)
        StackView.addArrangedSubview(informationLabel)
        StackView.addArrangedSubview(informationView)
        StackView.addArrangedSubview(itemTitleLabel)
        StackView.addArrangedSubview(itemCollectionView)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(DeviceInfo.screenWidth * 0.04102)
            make.top.equalToSuperview().offset(DeviceInfo.screenHeight * 0.1105826397)
        }

        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 4 / 844)
            make.leading.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
        
        scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(addressLabel.snp.bottom).offset(DeviceInfo.screenHeight * 28 / 844)
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 120 / 844)
        }
        
        StackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        mapView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 182 / 844)
        }
        
        informationLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        informationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 167 / 844)
        }

        itemTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(informationLabel.snp.left)
        }

        itemCollectionView.snp.makeConstraints { make in
            let cellHeight = (DeviceInfo.screenHeight * 74 / 844) + (DeviceInfo.verticalPadding / 2)
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(Int(cellHeight) * viewModel.items.count)
            make.centerX.equalToSuperview()
        }
        
        reservationButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 57 / 844)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(DeviceInfo.verticalPadding * 2)
        }
    }
}

// MARK: Button Action
extension StoreViewController {
    @objc
    func didReservationButtonTapped() {
        // TODO: print문 삭제 예정
        print("didReservationButtonTapped")
        reservationButton.isButtonSelected.toggle()
        viewModel.pushReservationViewController(items: viewModel.items)
    }
}
