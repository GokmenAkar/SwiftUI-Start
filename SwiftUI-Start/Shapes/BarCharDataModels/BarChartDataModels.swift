//
//  BarChartDataModels.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct Legend: Hashable {
    let color: Color
    let label: String
}

struct Bar: Identifiable {
    let id: UUID
    let value: Double
    let label: String
    let legend: Legend
}
