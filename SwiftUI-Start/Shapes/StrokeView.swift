//
//  StrokeView.swift
//  SwiftUI-Start
//
//  Created by Developer on 9.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct StrokeView: View {
    @State private var circleProgress: CGFloat = 0.8
    private var circlePercentage: Int { Int(circleProgress * 100.0) }
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: {}) {
                    Text("Rounded Button").bold().padding()
                }
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 1))
                Spacer()
                Button(action: {}) {
                    Text("Rounded Button").foregroundColor(Color.white).bold().padding()
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))

                
                ZStack {
                    Rectangle().padding(20).foregroundColor(Color.yellow)
                    Rectangle().padding(40).foregroundColor(Color.red)
                    Rectangle().padding(60).foregroundColor(Color.blue)
                    Rectangle().padding(80).foregroundColor(Color.black)
                }.frame(width: 200, height: 200)
                
                ZStack(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(width: 320, height: 250)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .frame(width: 280, height: 200)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 230, height: 160)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                        .frame(width: 200, height: 120)
                }
                
                Rectangle()
                    .trim(from: 0, to: circleProgress)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 12, lineCap: .square))
                    .frame(height: 300)
                    .overlay(Text("\(circlePercentage)%").font(.largeTitle))
                    .padding(40)
                
                VStack {
                    Text("Progress")
                    HStack {
                        Text("0%")
                        Slider(value: $circleProgress)
                        Text("100%")
                    }
                }.padding(40)
            }
        }
    }
}

struct StrokeView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeView()
    }
}
