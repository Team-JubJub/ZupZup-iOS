//
//  SetInfoViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/09.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

class SetTimeViewController: BaseViewController {
    
    private var viewModel: SetTimeViewModel
    
    private let titleLabel = ZupzupSubTitleLabel(title: "방문 예정 시간")
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .designSystem(weight: .regular, size: ._20)
        label.textColor = .designSystem(.orangeE49318)
        label.text = " "
        return label
    }()
    
    private let dismissButton: ZupzupDismissButton = {
        let button = ZupzupDismissButton()
        button.layer.cornerRadius = DeviceInfo.screenWidth * 30 / 390 / 2
        return button
    }()
    
    private let horizentalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .designSystem(.greyC8BCAB)
        return view
    }()
    
    private let setTimeButton = ZupzupButton(title: "시간 정하기")
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.locale = Locale(identifier: "en_US")
        picker.preferredDatePickerStyle = .wheels
        picker.setValue(false, forKey: "highlightsToday")
        return picker
    }()
    
    // MARK: Initializer
    init(viewModel: SetTimeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setBackground()
        setUI()
        setTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SetTimeViewController {
    private func setBackground() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubview(dismissButton)
        view.addSubview(setTimeButton)
        view.addSubview(titleLabel)
        view.addSubview(datePicker)
        view.addSubview(timeLabel)
        view.addSubview(horizentalLine)
        
        dismissButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.right.equalToSuperview().inset(DeviceInfo.screenWidth * 14 / 390)
            make.top.equalToSuperview().inset(DeviceInfo.screenHeight * 17 / 844)
        }
        
        setTimeButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 57 / 844)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(DeviceInfo.screenHeight * 34 / 844)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(DeviceInfo.verticalPadding)
        }
        
        datePicker.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(DeviceInfo.horizontalPadding)
            make.centerX.equalToSuperview()
            make.top.equalTo(horizentalLine.snp.bottom).offset(DeviceInfo.verticalPadding)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(DeviceInfo.screenHeight * 35 / 844)
        }
        
        horizentalLine.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(DeviceInfo.verticalPadding / 2)
        }
    }
    
    private func setTargets() {
        dismissButton.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
        setTimeButton.addTarget(self, action: #selector(tapSetTimeButton), for: .touchUpInside)
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
    
    @objc
    func tapDismissButton() {
        viewModel.dismissViewController()
    }
    
    @objc
    func tapSetTimeButton() {
        viewModel.setCurrentTime()
        viewModel.dismissViewController()
    }
    
    @objc
    func datePickerChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "H:mm a"
        dateFormatter.locale = Locale(identifier: "en_US")
        let date = dateFormatter.string(from: datePicker.date)
        
        timeLabel.text = date
        viewModel.getCurrentTime(currentTime: date)
        setTimeButton.isButtonSelected = viewModel.checkSetTimeButtonValidation(time: date)
    }
}
