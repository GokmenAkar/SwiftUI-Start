//
//  ServiceRequest.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class BaseServiceRequest<T: Codable> {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/users" 
    }
}
