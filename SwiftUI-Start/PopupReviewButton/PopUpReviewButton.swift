//
//  PopUpReviewButton.swift
//  SwiftUI-Start
//
//  Created by Developer on 22.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct PopUpReviewButton: View {
    var body: some View {
        ReviewButton()
    }
}

struct PopUpReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        PopUpReviewButton()
    }
}

struct ReviewButton: View {
    @State var popupOpen: Bool = false
    @State var stars: Int = 0
    
    var gesture: some Gesture {
        return DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { value in
                self.updateRating(x: value.location.x)
        }
        .onEnded { value in
            self.updateRating(x: value.location.x)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                self.popupOpen = false
                }
            }
        }
    }
    
    func updateRating(x: CGFloat) {
        let percent = max((x / 110.0), 0.0)
        stars = min(Int(percent * 5.0), 5)
    }
    
    var body: some View {
        Button(action: { self.popupOpen.toggle() }) {
            VStack(alignment: .center, spacing: 8) {
                RatingIcon()
                Text("Rate This")
                    .foregroundColor(.black)
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
            }
        }.overlay(
            HStack(spacing: 8) {
                RatingIcon(filled: stars > 0)
                RatingIcon(filled: stars > 1)
                RatingIcon(filled: stars > 2)
                RatingIcon(filled: stars > 3)
                RatingIcon(filled: stars > 4)
            }
            .padding(12)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
            .offset(x: 0, y: -70)
            .opacity(popupOpen ? 1.0 : 0.0)
            .animation(.default)
            .gesture(self.gesture)
        )
    }
}

struct ReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        ReviewButton().previewLayout(.sizeThatFits)
    }
}

struct RatingIcon: View {
    var filled: Bool = false
    var body: some View {
        Image(systemName: filled ? "star.fill" : "star")
            .font(.headline)
            .foregroundColor(filled ? Color.yellow : Color.black.opacity(0.6))
    }
}
