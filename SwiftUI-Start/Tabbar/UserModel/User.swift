//
//  User.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

extension User {
    static func testUser() -> User {
        let _geo     = Geo(lat: "-37.3159", lng: "81.1496")
        let _address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: _geo)
        let _company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
        return User(id: 1, name: "Leanne Graham", username: "Bret", email: "sincere@april.biz", address: _address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: _company)
    }
    
    static func testUsers(testCount: Int) -> [User] {
        var testUsers: [User] = [User]()
        for _ in 0..<testCount {
            testUsers.append(testUser())
        }
        return testUsers
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}


