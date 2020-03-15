//
//  RotationView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 15.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct RotationView: View {
    @State private var degrees: Double = 45.0
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.yellow)
                .overlay(Text("Degree View").font(.title))
                .frame(height: 180)
                .rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.2, y: 2.0, z: 0.0), anchor: .center)
            Slider(value: $degrees, in: -180...180, step: 1.0).padding()
        }
        .padding()
    }
}

struct RotationView_Previews: PreviewProvider {
    static var previews: some View {
        RotationView()
    }
}
