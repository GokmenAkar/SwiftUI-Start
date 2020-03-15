//
//  PositionView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 14.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct PositionView: View {
    
    var textView: some View {
        Text("Set the frame")
    }
    
    var body: some View {
        VStack {
            Text("X & Y coordinates start in the upper left corner.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            Image("XYCoordinates")
            ZStack {
                GeometryReader { geo in
                    Text("50, 20")
                        .position(x: 20, y: 20)
                    Text("350, 20")
                        .position(x: 350, y: 20)
                    Text("60, 230")
                        .position(x: 60, y: 230)
                    Text("350, 230")
                        .position(x: 350, y: 230)
                }
            }    .border(Color.purple, width: 5)
            Text("What you are positioning is actually the center point of the view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
        }
    }
}

struct TestTextView: View {
    let text: String
    var body: some View {
        Text(text)
    }
}

struct PositionView_Previews: PreviewProvider {
    static var previews: some View {
        PositionView()
    }
}
