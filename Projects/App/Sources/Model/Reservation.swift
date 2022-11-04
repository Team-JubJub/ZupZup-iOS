//
//  Reservation.swift
//  App
//
//  Created by YeongJin Jeong on 2022/11/04.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation

public enum reservationState {
    case New
    case Cancel
    case Confirm
    case Complete
}

public struct Reservation {

    let reservationId: Int
    let storeId: Int
    var state: reservationState
    let cartList: [Cart]
    let visitTime: String
    let customer: Customer

    public init(reservationId: Int,
                storeId: Int,
                state: reservationState,
                cartList: [Cart],
                visitTime: String,
                customer: Customer
    ) {
        self.reservationId = reservationId
        self.storeId = storeId
        self.state = state
        self.cartList = cartList
        self.visitTime = visitTime
        self.customer = customer
    }
}
