//
//  GestureView.swift
//  SwiftUI-Start
//
//  Created by Developer on 17.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct GestureView: View {
    
    @State private var tapped: Bool = false
    @State private var cardDragState: CGSize = .zero
    @State private var cardRotateState: Double = 0
    
    var body: some View {
        CardView(tapped: $tapped)
            .offset(y: self.cardDragState.height)
            .rotationEffect(Angle(degrees: cardRotateState))
            .gesture(RotationGesture()
                .onChanged({ (angle) in
                    self.cardRotateState = angle.degrees
                })
                .onEnded({ (value) in
                    withAnimation(.spring()) {
                        self.cardRotateState = 0
                    }
                })
                
        )
            .gesture(DragGesture()
                .onChanged { value in
                    self.cardDragState = value.translation
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    self.cardDragState = .zero
                }
                }
        )
            .gesture(TapGesture(count: 1)
                .onEnded {
                    self.tapped.toggle()
            })
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
