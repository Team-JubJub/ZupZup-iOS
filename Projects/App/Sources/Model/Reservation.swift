//
//  Reservation.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

// MARK: 예약
public enum reservationState {
    case New
    case Cancel
    case Confirm
    case Complete
}

public struct Reservation {
    let resId: Int
    let storeId: Int
    let userId: Int
    let reservationTime: String
    let sales: String
    let cartList: [Cart]
    let visitTime: String
    let state: reservationState
}
