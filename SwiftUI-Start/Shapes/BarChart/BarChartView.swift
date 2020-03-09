//
//  BarChartView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    let bars: [Bar]
    var body: some View {
        Group {
            if bars.isEmpty {
                Text("There is no data to display chart...")
            } else {
                VStack {
                    BarsView(bars: bars)
                    LabelsView(bars: bars, labelsCount: bars.count)
                    LegendView(bars: bars)
                }
                .padding()
                .accessibility(hidden: true)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(bars: [
            Bar(id: UUID(), value: 112, label: "Gol", legend: Legend(color: Color.red, label: "Gol")),
            Bar(id: UUID(), value: 94, label: "Muslera", legend: Legend(color: Color.blue, label: "Sampiyon")),
            Bar(id: UUID(), value: 162, label: "GS", legend: Legend(color: Color.green, label: "GS")),
            Bar(id: UUID(), value: 122, label: "Yesil", legend: Legend(color: Color.yellow, label: "Muslera"))
        ])
    }
}
