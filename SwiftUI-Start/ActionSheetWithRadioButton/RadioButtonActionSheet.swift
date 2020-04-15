//
//  RadioButtonActionSheet.swift
//  SwiftUI-Start
//
//  Created by Developer on 15.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct RadioButtonActionSheet: View {
    var body: some View {
        ZStack {
            Text("Home")
            VStack {
                Spacer()
                RadioButtons().offset(y: (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
            }
        }.background(Color("Color2").edgesIgnoringSafeArea(.all))
    }
}

struct RadioButtonActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonActionSheet()
    }
}

struct RadioButtons: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Filter By")
                .font(.title)
                .padding(.top)
            
            ForEach(data, id: \.self) { i in
                Button(action: { }) {
                    HStack {
                        Text(i)
                        Spacer()
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 20, height: 20)
                        
                    }.foregroundColor(.black)
                }.padding(.top)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
        .background(Color.white)
        .cornerRadius(25)
    }
}

var data = ["Revelance", "Newest", "Price(low to hight)", "Price(high to low)", "Sort by Specs", "Sort by Storage"]
