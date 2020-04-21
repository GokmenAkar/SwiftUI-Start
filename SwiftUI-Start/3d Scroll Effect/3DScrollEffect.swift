 //
 //  3DScrollEffect.swift
 //  SwiftUI-Start
 //
 //  Created by Developer on 21.04.2020.
 //  Copyright © 2020 Developer. All rights reserved.
 //
 
 import SwiftUI
 
 struct _DScrollEffect: View {
    var colors: [Color]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 230) {
                ForEach(colors, id: \.self) { color in
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(width: 200, height: 300, alignment: .center)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                    }
                }
            }
        }
    }
 }
 
 struct _DScrollEffect_Previews: PreviewProvider {
    static var previews: some View {
        _DScrollEffect(colors: [.blue, .green, .orange, .red, .gray, .pink, .yellow])
    }
 }
