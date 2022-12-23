//
//  AddReservationRepsitoryImpl.swift
//  ZupZupNetworkTests
//
//  Created by YeongJin Jeong on 2022/12/23.
//  Copyright © 2022 ZupZup. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import RxSwift

public protocol AddReservationRepository {
    func addReservation(completion: @escaping (Result<Response, Error>) -> Void)
}

public struct Response {
    let message: String = "Success To Add Reservation"
}

public class AddReservationRepsitoryImpl: AddReservationRepository {
    
    public init() {}
    
    let database = Firestore.firestore()
    
    public func addReservation(completion: @escaping (Result<Response, Error>) -> Void) {
        
        let reservationRef = database.collection("Reservation")
        
        let reservation = AddReservationDTO(customerName: "정영진",
                                            customerPhone: "010-4602-1620",
                                            state: "New",
                                            storeId: 1234,
                                            visitTime: 1630,
                                            reserveId: 1234,
                                            cartList: []
        )
        
        do {
            let _ = try reservationRef.addDocument(from: reservation)
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
        
        completion(.success(Response()))
    }
}

