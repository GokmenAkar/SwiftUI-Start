//
//  ColorScheme.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 14.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ColorScheme: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
            Image("kiacar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .mask(Image(systemName: "heart.fill").position(x: geo.size.width/2, y: geo.size.height/2))
            }
        }.frame(width: 200, height: 200)
        .font(.system(size: 200))
    }
}

struct ColorScheme_Previews: PreviewProvider {
    static var previews: some View {
        ColorScheme()
    }
}
