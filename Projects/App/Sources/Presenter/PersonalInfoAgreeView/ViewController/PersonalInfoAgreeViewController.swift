//
//  PersonalInfoAgreeViewController.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/21.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import UIKit

final class PersonalInfoAgreeViewController: BaseViewController {
    
    var viewModel: PersonalInfoAgreeViewModel
    
    private let agreeButton = {
        let button = ZupzupButton(title: "위 내용을 확인했고, 동의합니다.")
        button.isButtonSelected = true
        return button
    }()
    
    private let dismissButton: ZupzupDismissButton = {
        let button = ZupzupDismissButton()
        button.layer.cornerRadius = DeviceInfo.screenWidth * 30 / 390 / 2
        return button
    }()
    
    private let infoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .designSystem(weight: .medium, size: ._12)
        textView.backgroundColor = .designSystem(.greyF1EEE9)
        textView.isEditable = false
        textView.layer.cornerRadius = DeviceInfo.screenWidth * 15 / 390
        textView.text = "\n<개인정보 수집 동의> \n\n1. 기본수집항목\n필수 (휴대)전화번호, 방문예정시간 [선택] 이름\n\n2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존\n\n3. 보관기간\n\n서비스 운영 종료 후 파기\n\n단, 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함\n\n4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.\n\n개인정보 제공 동의\n\n<개인정보 제공 동의>\n\n1. 개인정보를 제공받는 자 : 줍줍\n\n2. 제공하는 기본 개인정보 항목: 필수(휴대)전화번호, 방문예정시간 [선택] 이름\n\n3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 서비스 혜택 및 맞춤 서비스 제공, 민원처리 등 고객상담, 고객관리, 서비스 이용에 따른 설문조사 및 혜택 제공, 분쟁조정을 위한 기록보존\n\n4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 서비스 운영 종료시 또는 위 개인정보 이용목적 달성 시 까지 이용합니다.\n\n5. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.\n"
        return textView
    }()
    
    // MARK: Initialize
    init(viewModel: PersonalInfoAgreeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        setUI()
        setButtonTargets()
    }
}

extension PersonalInfoAgreeViewController {
    
    private func setBackGround() {
        view.backgroundColor = .white
        view.layer.cornerRadius = DeviceInfo.screenWidth * 15 / 390
    }
    
    private func setUI() {
        view.addSubview(dismissButton)
        view.addSubview(infoTextView)
        view.addSubview(agreeButton)
        
        dismissButton.snp.makeConstraints { make in
            make.width.height.equalTo(DeviceInfo.screenWidth * 30 / 390)
            make.right.equalToSuperview().inset(DeviceInfo.verticalPadding)
            make.top.equalToSuperview().inset(DeviceInfo.horizontalPadding)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.height.equalTo(DeviceInfo.screenHeight * 57 / 844)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(DeviceInfo.verticalPadding * 2)
        }
        
        infoTextView.snp.makeConstraints { make in
            make.width.equalTo(DeviceInfo.screenWidth * 358 / 390)
            make.centerX.equalToSuperview()
            make.top.equalTo(dismissButton.snp.bottom).offset(DeviceInfo.verticalPadding)
            make.bottom.equalTo(agreeButton.snp.top).offset(-DeviceInfo.verticalPadding)
        }
    }
    
    private func setButtonTargets() {
        dismissButton.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
        agreeButton.addTarget(self, action: #selector(tapAgreeButton), for: .touchUpInside)
    }
    
    @objc
    func tapDismissButton() {
        viewModel.dismissViewController()
    }
    
    @objc func tapAgreeButton() {
        viewModel.dismissViewController()
        viewModel.setAgree()
    }
}
