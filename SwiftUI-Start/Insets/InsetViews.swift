//
//  InsetViews.swift
//  SwiftUI-Start
//
//  Created by Developer on 9.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct InsetViews: View {
    @State private var insetAmount: CGFloat = 45
    @State private var negativeInsetAmount: CGFloat = 0

    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .inset(by: 20)
                .frame(width: 100)
                .border(Color.red)
            Circle()
                .inset(by: negativeInsetAmount)
                .frame(width: 100)
                .border(Color.red)
            Rectangle()
                .inset(by: insetAmount)
                .fill(Color.purple)
                .frame(width: 200, height:200)
                .border(Color.yellow, width: 1)
            HStack {
                Text("0")
                Slider(value: $insetAmount, in: 0...95)
                Text("100")
            }.padding()
            Text("\(insetAmount)")
            HStack {
                Text("-100")
                Slider(value: $negativeInsetAmount, in: -100...100)
                Text("100")
            }.padding()
            Text("\(negativeInsetAmount)")
        }.padding()
    }
}

struct InsetViews_Previews: PreviewProvider {
    static var previews: some View {
        InsetViews()
    }
}
