//
//  ProgressShape.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    let progress: Double
    var body: some View {
        ProgressShape(progress: progress)
            .stroke(Color.blue, style: StrokeStyle(
                lineWidth: 4,
                lineCap: .round,
                lineJoin: .round,
                miterLimit: 0,
                dash: [],
                dashPhase: 0
                )
        )
        .padding()
    }
}

struct ProgressShape_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progress: 0)
    }
}

struct ProgressShape: Shape {
    let progress: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2,
                    startAngle: .degrees(270),
                    endAngle: .init(radians: 2 * Double.pi * progress + 1.5 * Double.pi),
                    clockwise: false)
        return path
    }
}


