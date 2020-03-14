//
//  AspectRatio_Intro.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 14.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct AspectRatio_Intro: View {
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            VStack(spacing: 4) {
                Text("Ratio 1:1")
                Image("kiafan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
            }
            
            VStack(spacing: 4) {
                Text("Ratio 1:2")
                Image("kiafan")
                    .resizable()
                    .aspectRatio(0.5, contentMode: .fit)
                    .frame(height: 120)
            }
            
            VStack(spacing: 4) {
                Text("Ratio 2:1")
                Image("kiafan")
                    .resizable()
                    .aspectRatio(2, contentMode: .fit)
                    .frame(height: 120)
            }
            
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.purple)
                    .frame(width: geo.size.width/2)
                    .aspectRatio(1.5, contentMode: .fit)
                    .overlay(Text("2:3 Aspect Ratio")
                        .foregroundColor(.white))
            }
            
            Button("Some Button") {
                
            }
            .padding()
            .background(Color.yellow)
            
        }
    }
}

struct AspectRatio_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AspectRatio_Intro()
    }
}
