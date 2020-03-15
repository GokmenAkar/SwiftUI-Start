//
//  BlurTestView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 14.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BlurTestView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)

            VStack {
                Text("Lorem ipsum")
                Spacer()
                HStack(spacing: 0) {
                    Spacer()
                    Image("kiacar")
                        .resizable()
                        //                .aspectRatio(contentMode: .fit)
                        //                .frame(width: 120)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .blur(radius: 5)
                    Image("kiacar")
                        .resizable()
                        //                .aspectRatio(contentMode: .fit)
                        //                .frame(width: 120)
                        .blur(radius: 2)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .scaledToFit()
                    
                    Image("kiacar")
                        .resizable()
                        //                .aspectRatio(contentMode: .fit)
                        //                .frame(width: 120)
                        .blur(radius: 4)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    
                    Spacer()
                }
            }.blur(radius: 1)
            
            
            VStack(spacing: 20) {
                Text("Hello")
                .frame(maxWidth: .infinity)
                .background(Color.green)
                Spacer()
                Button("Selam") {
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.green)
            }
            .background(Color.white)
            .frame(width: 200, height: 100)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}

struct BlurTestView_Previews: PreviewProvider {
    static var previews: some View {
        BlurTestView()
    }
}
