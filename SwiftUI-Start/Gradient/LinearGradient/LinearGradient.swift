//
//  LinearGradient.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 10.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        let gradientColors = Gradient(colors: [Color.pink, Color.purple])
        let linearGradient = LinearGradient(gradient: gradientColors, startPoint: .topTrailing, endPoint: .bottomLeading)
        
        return VStack(spacing: 20) {
            ZStack {
                Rectangle()
                    .fill(linearGradient)
                    .frame(maxHeight: 120)
                Text("Some Text")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, maxHeight: 120)
            }
            
            Button(action: { }) {
                Text("Button")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(12)
            }
            .background(linearGradient)
            .cornerRadius(12)
            
            Circle()
                .strokeBorder(linearGradient, lineWidth: 12)
                .frame(height: 200)
        }
    }
}

struct LinearGradient_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientView()
    }
}
