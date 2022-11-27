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
    
    private let titleLabel = ZupzupTitleLabel(title: "영진상회")
    
    private lazy var mapview: MKMapView = {
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
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .designSystem(.greyC8BCAB)
        label.text = "부산광역시 장전동 123-48 1층"
        label.font = .designSystem(weight: .regular, size: ._15)
        return label
    }()
    
    private let StackView = UIStackView()
    
    init(viewModel: StoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension StoreViewController {
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(addressLabel)
        view.addSubview(mapview)
        view.addSubview(informationLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(DeviceInfo.screenWidth * 0.04102)
            make.top.equalToSuperview().offset(DeviceInfo.screenHeight * 0.1105826397)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 4 / 844)
            make.leading.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
        
        mapview.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(addressLabel.snp.bottom).offset(DeviceInfo.verticalPadding)
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 182 / 844)
        }
        
        informationLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(mapview.snp.bottom).offset(DeviceInfo.screenHeight * 24 / 844)
        }
    }
}

