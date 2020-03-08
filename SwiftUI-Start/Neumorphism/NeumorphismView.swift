//
//  NeumorphismView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct NeumorphismView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("BackgroundColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            NeuContentView()
        }
    }
}

struct NeumorphismView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismView()
    }
}

struct NeuContentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
        .fill(Color("BackgroundColor"))
        .frame(width: 300, height: 180)
        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
    }
}

struct NeuContentView_Previews: PreviewProvider {
    static var previews: some View {
        NeuContentView().previewLayout(.sizeThatFits)
    }
}
