//
//  BarGraph.swift
//  SwiftUI-Start
//
//  Created by Developer on 17.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BarGraph: View {
    let reports: [Report]
    
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                ForEach(self.reports, id: \.year) { report in
                    BarView(report: report)
                }
            }.padding()
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph(reports: Report.all())
    }
}

struct BarView: View {
    let report: Report
    @State private var showGraph: Bool = false
    
    var body: some View {
        let value = report.revenue / 500
        let yValue = Swift.min(value * 20, 500)
        
        return VStack {
            Text(String(format: "$%.2f", report.revenue))
            Rectangle()
                .fill(Color.red)
                .frame(maxWidth: .infinity, maxHeight: self.showGraph ? CGFloat(yValue) : 0.0 )
            
                .onAppear {
                    withAnimation(.spring()) {
                        self.showGraph = true
                    }
            }
            Text(report.year)
        }.padding()
    }
}

