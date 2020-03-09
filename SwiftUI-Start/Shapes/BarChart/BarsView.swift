//
//  BarsView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BarsView: View {
    let bars: [Bar]
    let max: Double
    
    init(bars: [Bar]) {
        self.bars = bars
        self.max = bars.map { $0.value }.max() ?? 0
    }
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(self.bars) { bar in
                    Capsule()
                        .fill(bar.legend.color)
                        .frame(height: CGFloat(bar.value) / CGFloat(self.max) * geometry.size.height)
                        .overlay(Rectangle().stroke(Color.white))
                        .accessibility(label: Text(bar.label))
                        .accessibility(value: Text(bar.legend.label))
                }
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
    
    func someFnc()  {
        let _ = 162 / 162 * 635
        let _ = 94 / 162 * 635
    }
}

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsView(bars: [
            Bar(id: UUID(), value: 112, label: "tete", legend: Legend(color: Color.red, label: "okroek")),
            Bar(id: UUID(), value: 94, label: "tete", legend: Legend(color: Color.blue, label: "okroek")),
            Bar(id: UUID(), value: 162, label: "tete", legend: Legend(color: Color.green, label: "okroek")),
            Bar(id: UUID(), value: 122, label: "tete", legend: Legend(color: Color.yellow, label: "okroek"))
        ])
    }
}
