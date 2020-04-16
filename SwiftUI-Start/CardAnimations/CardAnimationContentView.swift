//
//  CardAnimationContentView.swift
//  SwiftUI-Start
//
//  Created by Developer on 16.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CardAnimationContentView: View {
    @State var move: Bool = false
    
    var body: some View {
        ZStack {
            AniCardView(title: "Purple", colors: .purple)
                .offset(x: 0, y: move ? -240 : -180)
                .scaleEffect(move ? 1 : 0.75).onTapGesture {
                    self.move.toggle()
            }
            
            AniCardView(title: "Red", colors: .red)
                .offset(x: 0, y: move ? 0 : -45)
                .scaleEffect(move ? 1 : 0.75).onTapGesture {
                    self.move.toggle()
            }
            AniCardView(title: "Yellow", colors: .yellow)
                .offset(x: 0, y: move ? 240 : 90)
                .scaleEffect(move ? 1 : 0.75).onTapGesture {
                    self.move.toggle()
            }
        }.animation(.spring())
    }
}

struct CardAnimationContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardAnimationContentView()
    }
}

struct AniCardView: View {
    let title: String
    let colors: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colors)
                .cornerRadius(12)
                .frame(width: 330, height: 220)
            
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .shadow(color: .gray, radius: 10, x: 1, y: 1)
    }
}
