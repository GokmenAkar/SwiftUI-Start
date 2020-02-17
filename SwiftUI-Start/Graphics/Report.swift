//
//  Report.swift
//  SwiftUI-Start
//
//  Created by Developer on 17.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct Report: Hashable {
    let year: String
    let revenue: Double
}

extension Report {
    static func all() -> [Report] {
        return [
            Report(year: "2001", revenue: 1500),
            Report(year: "2002", revenue: 3500),
            Report(year: "2003", revenue: 8500)
        ]
    }
}
