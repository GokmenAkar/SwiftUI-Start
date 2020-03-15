//
//  BlendView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 14.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BlendView: View {
    var body: some View {
        VStack {
            ZStack {
                BlueRectangle()
                YellowRectangle().offset(x: 50, y: 50).blendMode(.hue)
                RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                    .shadow(radius: 5).offset(x: -50, y: -50).blendMode(.hardLight)

            }
        }
    }
}

struct BlendView_Previews: PreviewProvider {
    static var previews: some View {
        BlendView()
    }
}

struct BlueRectangle: View {    var body: some View {        RoundedRectangle(cornerRadius: 15)            .foregroundColor(.blue)            .frame(width: 100, height: 100)            .shadow(radius: 5)            .overlay(Text("Back Layer").foregroundColor(.white))    }}

struct YellowRectangle: View {    var body: some View {
    RoundedRectangle(cornerRadius: 15)
        .foregroundColor(.gray)
        .frame(width: 100, height: 100)
        .shadow(radius: 5)
    
    }}
