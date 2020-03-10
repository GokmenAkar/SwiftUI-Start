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
        let radial = RadialGradient(gradient: Gradient(colors: [.white, .red]),
                                    center: UnitPoint.center,
                                    startRadius: 10,
                                    endRadius: 420)
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
            
            HStack {
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(LinearGradient(gradient: gradientColors,
                                         startPoint: .leading,
                                         endPoint: .bottom))
                    .frame(width: 100, height: 100)
            }
            
            Rectangle()
                .fill(RadialGradient(gradient: Gradient(colors: [.red, .white]), center: .bottomTrailing, startRadius: 0, endRadius: 45))
                .frame(width: 85, height: 84)
                .rotationEffect(.degrees(45))
                .shadow(color: .black, radius: 20, x: 0, y: 20)
            Spacer()
        }
        .frame(maxHeight:. infinity)
//        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .background(radial)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LinearGradient_Previews: PreviewProvider {
    static var previews: some View {
        LinearGradientView()
    }
}
