//
//  HikeDetail.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

  struct HikeDetail: View {
    var hike: Hike
    
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Image(hike.imageURL)
                .resizable()
                .clipShape(Circle())
                .cornerRadius(20)
                .overlay(Circle().stroke(Color.red, lineWidth: 4))
                .aspectRatio(contentMode: .fit)
                .frame(width: self.zoomed ? 400 : 200, height: self.zoomed ? 400 : 200, alignment: .center)
                .padding(.all, 20)
                .shadow(radius: 12).onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
            }
            
            Text(hike.name)
            Text(String(format: "%.2f Miles", hike.miles))
            
            Button(action: {
                
            }) {
                Image(systemName: "circle.grid.hex.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Circle())
            .foregroundColor(.purple)
            .accentColor(.white)
            
        }.navigationBarTitle(Text(hike.name), displayMode: .inline)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike(name: "Los Angeles", imageURL: "kiacar", miles: 12.5230))
    }
}
