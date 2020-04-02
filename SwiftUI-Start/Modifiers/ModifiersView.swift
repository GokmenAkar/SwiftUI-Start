//
//  ModifiersView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 18.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ModifiersView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.yellow
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(TextModifier())
                .anchorPreference(key: BoundsPreferencesKey.self, value: .bounds) { $0 }
            }
            Button("Okey") {
                
            }.modifier(TextModifier())
            RoundedRectangle(cornerRadius: 14)
                .addOutline(lineWidth: 8, trim: 1)
                .padding()
        } .overlayPreferenceValue(BoundsPreferencesKey.self) { preferences in
            GeometryReader { geometry in
                preferences.map {
                    Rectangle()
                        .stroke()
                        .frame(
                            width: geometry[$0].width,
                            height: geometry[$0].height
                    )
                        .offset(
                            x: geometry[$0].minX,
                            y: geometry[$0].minY
                    )
                }
            }
        }
    }
}

struct ModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersView()
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.largeTitle)
            .foregroundColor(.gray)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.red, lineWidth: 4)
        )
            .padding()
    }
}

extension Shape {
    func addOutline(lineWidth: CGFloat = 1, trim: CGFloat = 1) -> some View {
        let gradientColors = Gradient(colors: [.pink, .purple])
        let linearGradient = LinearGradient(gradient: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
        
        return self
            .trim(from: 0, to: trim)
            .stroke(linearGradient, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
    }
}

struct BoundsPreferencesKey: PreferenceKey {
    typealias Value = Anchor<CGRect>?
    static var defaultValue: Value = nil
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}


