//
//  LabelsView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct LabelsView: View {
    let bars: [Bar]
    let labelsCount: Int
    
    private var threshold: Int {
        let threshold = bars.count / labelsCount
        return threshold == 0 ? 1 : threshold
    }
    
    var body: some View {
        HStack {
            ForEach(0..<bars.count, id:\.self) { index in
                Group {
                    if index % self.threshold == 0 {
                        Spacer()
                        Text(self.bars[index].label).font(.caption)
                        Spacer()
                    }
                }
            }
        }
    }
}
