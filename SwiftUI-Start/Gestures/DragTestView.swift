//
//  DragTestView.swift
//  SwiftUI-Start
//
//  Created by Developer on 20.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct DragTestView: View {
    @State private var circlePosition = CGPoint(x: 50, y: 50)
    @State private var circleTitle = "50,50"
    @GestureState private var isDragging: Bool = false
    @State private var isOk: Bool = false
    
    var body: some View {
        VStack {
            Text("Aman Tanrim").frame(height: 240)
            Circle()
                .fill(isDragging ? Color.orange : Color.blue)
                .frame(width: 100, height: 100)
                .opacity(0.8)
                .overlay(
                    Text(circleTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white))
                .position(circlePosition)
                .gesture(
                    DragGesture()
                        .onEnded({ (value) in
                            withAnimation {
                                self.circlePosition = CGPoint(x: 52, y: 52)
                                self.circleTitle = "52,52"
                                
                                self.isOk = value.location.y < 200
                            }
                        })
                        .onChanged({ (value) in
                            self.circlePosition = value.location
                            self.circleTitle = "\(Int(value.location.x)), \(Int(value.location.y))"
                        })
                        .updating($isDragging, body: { (value, state, transaction) in
                            print("value: ", value,  "state: ", state, "transaction: ", transaction)
                            state = true
                        })
            ).background(isOk ? Color.white : Color.red)
                .border(Color.red)
        }
    }
}

struct DragTestView_Previews: PreviewProvider {
    static var previews: some View {
        DragTestView()
    }
}
