//
//  AddReservationUseCase.swift
//  AppTests
//
//  Created by YeongJin Jeong on 2022/12/23.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import ZupZupNetwork
import CoreLocation

protocol AddReservationUseCase {
    func addReservation(
        customer: Customer,
        store: Store,
        items: [Item],
        completion: @escaping (Result<Int, Error>) -> Void)
}

final class AddReservationUseCaseImpl: AddReservationUseCase {
    
    private let addReservationRepsitory: AddReservationRepository
    
    init(addReservationRepsitory: AddReservationRepository = AddReservationRepsitoryImpl()) {
        self.addReservationRepsitory = addReservationRepsitory
    }
    
    // TODO: Completion Handler
    func addReservation(
        customer: Customer,
        store: Store,
        items: [Item],
        completion: @escaping (Result<Int, Error>) -> Void) {
            
            let cartDTO = items.map { item in
                return AddReservationDTO.CartDTO(
                    itemId: item.itemId,
                    storeId: item.storeId,
                    amount: item.numOfSelected,
                    name: item.itemName,
                    salesPrice: item.discountPrice
                )
            }
            
            let reservationDTO = AddReservationDTO (
                customerName: customer.vistor,
                customerPhone: customer.phoneNumber,
                state: "NEW",
                storeId: store.storeId,
                visitTime: dateToInt(visitTime: customer.visitTime),
                reserveId: 1,
                cartList: cartDTO
            )
            
            addReservationRepsitory.addReservation(addReservationDTO: reservationDTO) { result  in
                switch result {
                case .success(let time):
                    completion(.success(time))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
    func dateToInt(visitTime: String) -> Int {
        let time = visitTime.filter { $0.isNumber }
        return Int(time) ?? 0
    }
}
