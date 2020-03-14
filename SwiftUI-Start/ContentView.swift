//
//  ContentView.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape: Bool = false
    var body: some View {
        VStack(spacing: 32) {
            
            
            HStack {
                OrangeRectangle()
                    .overlay(
                        Text("Left Shape")
                            .foregroundColor(.black)
                )
                
                if showShape {
                    OrangeRectangle()
                        .overlay(
                            Text("Right Shape")
                    )
                }
            }
            
            OrangeRectangle()
            OrangeRectangle()
            
            Text("Gelibolu")
                .foregroundColor(.white)
                .padding(12)
                .padding(.vertical, 0)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.purple))
            
            Button("show/hide") {
                self.showShape.toggle()
            }
            .padding()
        }
    }
}

struct OrangeRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20).foregroundColor(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
