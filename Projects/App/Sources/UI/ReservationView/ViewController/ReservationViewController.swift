//
//  ReservationViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class ReservationViewController: BaseViewController {
    
    // MARK: UI component
    private var viewModel: ReservationViewModel
    
    private let titleLabel = ZupzupTitleLabel(title: "예약하기")
    
    private let storeInformationView = StoreInformationView()
    
    private let shoppingItemView = ShoppingItemView()
    
    private let visitTimeView = VisitTimeView()
    
    private let visitorView = VisitorView()
    
    private let personInformationAgreeView = PersonInformationAgreeView()
    
    private let mainStackView: UIStackView = {
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
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private let shoppingItemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 14
        return stackView
    }()
    
    private lazy var itemListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ItemListTableViewCell.self, forCellReuseIdentifier: ItemListTableViewCell.identifier)
        tableView.isScrollEnabled = false
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 14
        tableView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: Initializer
    init(viewModel: ReservationViewModel) {
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
}

// MARK: TableView Delegate
extension ReservationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier, for: indexPath) as? ItemListTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int(DeviceInfo.screenHeight * 37 / 844))
    }
}

// MARK: UI
extension ReservationViewController {
    private func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(storeInformationView)
        view.addSubview(scrollView)
        
        shoppingItemStackView.addArrangedSubview(shoppingItemView)
        shoppingItemStackView.addArrangedSubview(itemListTableView)
        
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(shoppingItemStackView)
        mainStackView.addArrangedSubview(visitTimeView)
        mainStackView.addArrangedSubview(visitorView)
        mainStackView.addArrangedSubview(personInformationAgreeView)
        
        
        // MARK: Constraints
        
        // superView == view
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(DeviceInfo.screenWidth * 0.04102)
            make.top.equalToSuperview().offset(DeviceInfo.screenHeight * 0.1105826397)
        }
        
        storeInformationView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 36 / 844)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(DeviceInfo.screenHeight * 76 / 844)
        }
        
        scrollView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth)
            make.height.equalTo(DeviceInfo.screenHeight * 592 / 844)
            make.top.equalTo(storeInformationView.snp.bottom).offset(DeviceInfo.screenHeight * 24 / 844)
            make.centerX.equalToSuperview()
        }
        
        // superView == scrollView
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // superView == mainStackView
        
        visitTimeView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 74 / 844)
        }
        
        visitorView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 97 / 844)
        }
        
        // superView == shoppingItemStackView
        shoppingItemView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 97 / 844)
        }
        
        itemListTableView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(Int(DeviceInfo.screenHeight * 37 / 844) * (viewModel.items.count))
        }
        
        personInformationAgreeView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 64 / 844)
        }
    }
}
