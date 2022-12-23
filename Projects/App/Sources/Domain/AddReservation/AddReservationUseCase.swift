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
    func addReservation(completion: @escaping (Result<Response,Error>) -> Void)
}

final class AddReservationUseCaseImpl: AddReservationUseCase {
    
    private let addReservationRepsitory: AddReservationRepository
    
    init(addReservationRepsitory: AddReservationRepository = AddReservationRepsitoryImpl()) {
        self.addReservationRepsitory = addReservationRepsitory
    }
    
    // TODO: Completion Handler
    func addReservation(completion: @escaping (Result<Response,Error>) -> Void) {
        addReservationRepsitory.addReservation { result  in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
