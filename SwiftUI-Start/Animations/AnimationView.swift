//
//  AnimationView.swift
//  SwiftUI-Start
//
//  Created by Developer on 20.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    
    @State private var showDetails: Bool = false
     var body: some View {
        VStack(spacing: 42) {
            Button("Press me") {
                self.showDetails.toggle()
            }
            
            HStack {
                Text(self.showDetails ? "Hide Details" : "Show Details")
                Image(systemName: "chevron.up.square")
                    .rotationEffect(.degrees(self.showDetails ? 0 : 180))
                    .animation(.default)
            }
            
            Button("Move me") {
                self.showDetails.toggle()
            }
            
            HStack {
                Text("🛬")
                    .font(.custom("Arial", size: 94))
                    .offset(x: self.showDetails ? UIScreen.main.bounds.width - 120 : 0)
                    .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
                Spacer()
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
