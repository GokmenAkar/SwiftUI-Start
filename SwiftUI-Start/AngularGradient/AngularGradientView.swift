//
//  AngularGradientView.swift
//  SwiftUI-Start
//
//  Created by Developer on 9.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct AngularGradientView: View {
    var body: some View {
        let gradient = Gradient(colors: [.pink, .purple, .pink])
        let angularGradient = AngularGradient(gradient: gradient, center: .center)
        let noncenteredGradient = AngularGradient(gradient: gradient, center: .bottomTrailing, angle: .degrees(0))
        
        return VStack(spacing: 24) {
            HStack {
                Rectangle().fill(angularGradient)
                Rectangle().fill(noncenteredGradient)
            }
            HStack {
                Circle() .fill(angularGradient)
                Ellipse().fill(angularGradient)
                Capsule().fill(angularGradient)
            }
            HStack(spacing: 20) {
                Circle()
                    .trim(from: 0.5, to: 1)
                    .stroke(angularGradient, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .rotationEffect(.degrees(90))
                Circle()
                    .trim(from: 0.5, to: 1)
                    .stroke(angularGradient, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .rotationEffect(.degrees(270))
            }
            HStack {
                Button(action: {}) {
                    Text("Gradient on Background")
                        .foregroundColor(Color.white)
                        .padding()
                }
                .padding(.horizontal)
                .background(Capsule().fill(angularGradient))
            }
        }.padding()
    }
}

struct AngularGradientView_Previews: PreviewProvider {
    static var previews: some View {
        AngularGradientView()
    }
}
