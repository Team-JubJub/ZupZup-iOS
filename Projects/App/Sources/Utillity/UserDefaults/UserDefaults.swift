//
//  UserDefaults.swift
//  App
//
//  Created by mctdev on 2023/01/12.
//  Copyright © 2023 ZupZup. All rights reserved.
//

import Foundation

class ReservationContainer {
    
    static let shared = ReservationContainer()
    
    private init() {
        LoadReservation()
    }
    
    var reservation = [Int]()
    
    func LoadReservation() {
        guard let array = UserDefaults.standard.array(forKey: "Reservation") as? [Int] else { return }
        self.reservation = array
    }
    
    func appendReservation(time: Int) {
        self.reservation.append(time)
        UserDefaults.standard.set(self.reservation, forKey: "Reservation")
    }
    
    func getReservation() -> [Int] {
        return self.reservation
    }
}
