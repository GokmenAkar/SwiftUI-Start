//
//  CardView.swift
//  SwiftUI-Start
//
//  Created by Developer on 17.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var tapped: Bool
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            Image("1")
                .resizable()
                .scaleEffect(scale)
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fill)
                .gesture(MagnificationGesture()
                    .onChanged{ value in
                        self.scale = value.magnitude
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        self.scale = 1
                    }
                }
            )
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(tapped ? Color.purple : Color.green)
        .cornerRadius(30)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(tapped: .constant(false))
    }
}
