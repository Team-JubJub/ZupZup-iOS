//
//  ReservationCompletedViewCoordinating.swift
//  App
//
//  Created by YeongJin Jeong on 2022/12/23.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

protocol ReservationCompletedViewCoordinating {
    func pushReservationCompletedViewController(
        store: Store,
        items: [Item],
        customer: Customer
    )
}
