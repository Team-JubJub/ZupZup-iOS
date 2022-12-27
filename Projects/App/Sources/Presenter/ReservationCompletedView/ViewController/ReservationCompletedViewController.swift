//
//  ReservationCompletedViewController.swift
//  AppTests
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit
import SnapKit
import DesignSystem

class ReservationCompletedViewController: BaseViewController {
    
    private var viewModel: ReservationCompletedViewModel
    
    private let titleLabel = ZupzupTitleLabel(title: "예약완료")
    
    private let storeInformationView = StoreInformationView()
    
    private let shoppingItemView = ShoppingItemView()
    
    private let visitTimeView: VisitTimeView = {
        let visitTimeView = VisitTimeView()
        visitTimeView.rightChevronImageView.isHidden = true
        return visitTimeView
    }()
    
    private let visitorView: VisitorView = {
        let visitorView = VisitorView()
        visitorView.rightChevronImageView.isHidden = true
        return visitorView
    }()
    
    private let goToHomeButton = {
        let button = ZupzupButton(title: "홈으로")
        button.isButtonSelected = true
        return button
    }()
    
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
    init(viewModel: ReservationCompletedViewModel) {
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
        setButtonTargets()
        configureLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension ReservationCompletedViewController {
    private func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(storeInformationView)
        view.addSubview(scrollView)
        view.addSubview(goToHomeButton)
        
        shoppingItemStackView.addArrangedSubview(shoppingItemView)
        shoppingItemStackView.addArrangedSubview(itemListTableView)
        
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(shoppingItemStackView)
        mainStackView.addArrangedSubview(visitTimeView)
        mainStackView.addArrangedSubview(visitorView)
    
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.top.equalToSuperview().offset(DeviceInfo.screenHeight * 93 / 844)
        }
        
        storeInformationView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 36 / 844)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(DeviceInfo.screenHeight * 76 / 844)
        }
        
        scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(storeInformationView.snp.bottom).offset(DeviceInfo.screenHeight * 24 / 844)
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 120 / 844)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        visitTimeView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 74 / 844)
        }
        
        visitorView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 97 / 844)
        }
        
        shoppingItemView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 97 / 844)
        }
        
        itemListTableView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(Int(DeviceInfo.screenHeight * 37 / 844) * (viewModel.items.count))
        }
        
        goToHomeButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 57 / 844)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(DeviceInfo.verticalPadding * 2)
        }
    }
    
    private func setButtonTargets() {
        goToHomeButton.addTarget(self, action: #selector(tapGoToHomeButton), for: .touchUpInside)
    }
    
    private func configureLabels() {
        shoppingItemView.totalPriceLabel.text = "\(viewModel.setTotalPrice())원"
        shoppingItemView.itemCountLabel.text = "\(viewModel.setTotalNumOfItems())개"
        storeInformationView.storeAddressLabel.text = viewModel.setStoreAddress()
        storeInformationView.storeNameLabel.text = viewModel.setStoreTitle()
        visitorView.phoneNumberLabel.text = viewModel.phoneNumber
        visitorView.visitorLabel.text = viewModel.visitor
        visitTimeView.timeLabel.text = viewModel.visitTime
    }
    
    @objc
    func tapGoToHomeButton() {
        viewModel.popToRootView()
    }
}

// MARK: TableView Delegate
extension ReservationCompletedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Fix
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier, for: indexPath) as? ItemListTableViewCell else { return UITableViewCell() }
        let item = viewModel.items[indexPath.row]
        cell.configure(
            itemTitle: item.itemName,
            itemPrice: item.discountPrice,
            numOfItem: item.numOfSelected
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int(DeviceInfo.screenHeight * 37 / 844))
    }
}


