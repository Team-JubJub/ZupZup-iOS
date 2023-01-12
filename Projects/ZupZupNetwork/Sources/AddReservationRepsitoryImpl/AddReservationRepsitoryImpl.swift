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
    func addReservation(addReservationDTO: AddReservationDTO, completion: @escaping (Result<Int, Error>) -> Void)
}

public class AddReservationRepsitoryImpl: AddReservationRepository {
    
    public init() {}
    
    let database = Firestore.firestore()
    
    public func addReservation(addReservationDTO: AddReservationDTO ,completion: @escaping (Result<Int, Error>) -> Void) {
        
        let reservationRef = database.collection("Reservation")
        
        var reservation = addReservationDTO
        
        let timeMillis = Int(Date().timeIntervalSince1970 * 1000)
        
        let documentId = String(timeMillis)
        
        reservation.reserveId = timeMillis
        
        do {
            let _ = try reservationRef.document(documentId).setData(from: reservation)
        } catch let error {
            print(error.localizedDescription)
            completion(.failure(error))
        }
        
        completion(.success(timeMillis))
    }
}

