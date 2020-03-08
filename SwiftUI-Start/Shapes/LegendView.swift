//
//  LegendView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct LegendView: View {
    let legends: [Legend]
    
    init(bars: [Bar]) {
        legends = Array(Set(bars.map { $0.legend }))
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(legends, id: \.self) { legend in
                VStack(alignment: .center) {
                    Circle()
                        .fill(legend.color)
                        .frame(width: 16, height: 16)
                    Text(legend.label)
                        .font(.subheadline)
                        .lineLimit(nil)
                }
            }
        }
    }
}

struct LegendView_Previews: PreviewProvider {
    static var previews: some View {
        LegendView(
            bars: [
                Bar(id: UUID(), value: 112, label: "tete", legend: Legend(color: Color.red, label: "Gol")),
                Bar(id: UUID(), value: 94, label: "tete", legend: Legend(color: Color.blue, label: "Sampiyon")),
                Bar(id: UUID(), value: 162, label: "tete", legend: Legend(color: Color.green, label: "GS")),
                Bar(id: UUID(), value: 122, label: "tete", legend: Legend(color: Color.yellow, label: "Muslera"))
            ]
        )
    }
}
