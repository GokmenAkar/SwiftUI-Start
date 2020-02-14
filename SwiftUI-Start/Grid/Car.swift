//
//  Car.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct Car: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageURL: String
    let isSold: Bool
}

extension Car {
    static func all() -> [Car] {
        return [
            Car(name: "Car 1", price: 32000, imageURL: "1", isSold: false),
            Car(name: "Car 2", price: 45000, imageURL: "2", isSold: true) ,
            Car(name: "Car 3", price: 27000, imageURL: "kiacar", isSold: false),
            Car(name: "Car 4", price: 32000, imageURL: "4", isSold: false),
            Car(name: "Car 5", price: 45000, imageURL: "kiacar", isSold: true) ,
            Car(name: "Car 6", price: 27000, imageURL: "3", isSold: true) ,
            Car(name: "Car 7", price: 32000, imageURL: "kiacar", isSold: false)
        ]
    }
}
