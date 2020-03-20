//
//  DragFromLeftView.swift
//  SwiftUI-Start
//
//  Created by Developer on 20.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct DragFromLeftView: View {
    @State private var currentSliderPositionX: CGFloat = 0.0
    @GestureState private var slideOffset = CGSize.zero
    @GestureState private var circleOffset = CGSize.zero
    
    @State private var isLongPress: Bool = false
    @State private var isPressing: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Gestures")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 120)
                .background(Color.blue)
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 1)
                    .frame(width: 100, height: 100)
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.blue)
                    .offset(circleOffset)
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .updating($circleOffset, body: { (value, circleOffset, transaction) in
                                circleOffset = value.translation
                            })
                )
            }
            
            VStack {
                Text("Long Press")
                Image(systemName: "lock.fill")
                    .font(.system(size: 100))
                    .foregroundColor(isLongPress ? .green : .red)
                    .onLongPressGesture(minimumDuration: 2, pressing: { (value) in
                        self.isPressing = value
                    }) {
                        self.isLongPress.toggle()
                }.padding()
                Text("Keep Pressing").opacity(isPressing ? 1.0 : 0.0)
            }
            
            GeometryReader { gr in
                HStack {
                    Spacer()
                    Image(systemName: "line.horizontal.3").rotationEffect(.init(degrees: 90))
                }
                .foregroundColor(.white)
                .frame(height: 100)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                .offset(x: self.currentSliderPositionX + self.slideOffset.width)
                .gesture(DragGesture()
                .updating(self.$slideOffset, body: { (value, slideOffset, transaction) in
                    print(value.translation.width, slideOffset.width)
                    slideOffset = value.translation
                })
                    .onEnded({ (value) in
                        print(value.translation, gr.size.width)
                        if value.translation.width < -gr.size.width * 0.6 {
                            self.currentSliderPositionX = 50 - gr.size.width
                        } else {
                            self.currentSliderPositionX = 0
                        }
                    })
                ).animation(.default)
            }
        }
    }
}

struct DragFromLeftView_Previews: PreviewProvider {
    static var previews: some View {
        DragFromLeftView()
    }
}
