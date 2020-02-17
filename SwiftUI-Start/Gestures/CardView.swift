//
//  CardView.swift
//  SwiftUI-Start
//
//  Created by Developer on 17.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var tapped: Bool
    var body: some View {
        VStack {
            Text("Hello World")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(tapped ? Color.purple : Color.green)
        .cornerRadius(30)
    .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(tapped: .constant(false))
    }
}
