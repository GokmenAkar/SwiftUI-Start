//
//  RadioButtonActionSheet.swift
//  SwiftUI-Start
//
//  Created by Developer on 15.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct RadioButtonActionSheet: View {
    @State var selected = ""
    @State var show = false
    var body: some View {
        ZStack {
            Text("Home")
            VStack {
                Spacer()
                RadioButtons(selected: self.$selected, show: self.$show).offset(y: (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
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
    @Binding var selected: String
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Filter By")
                .font(.title)
                .padding(.top)
            
            ForEach(data, id: \.self) { i in
                Button(action: {
                    
                    self.selected = i
                }) {
                    HStack {
                        Text(i)
                        Spacer()
                        
                        ZStack {
                            Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 20, height: 20)
                            
                            if self.selected == i {
                                Circle().stroke(Color("Color1"), lineWidth: 4).frame(width: 30, height: 30)
                            }
                        }
                        
                        
                    }.foregroundColor(.black)
                }.padding(.top)
            }
            HStack {
                Spacer()
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    Text("Continue").padding(.vertical).padding(.horizontal, 25).foregroundColor(.white)
                }
                .background(
                    self.selected != "" ?
                    
                        LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: .init(colors: [Color.black.opacity(0.2), Color.black.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
                    
                    
                
                )
                .clipShape(Capsule())
                    .disabled(self.selected != "" ? false : true)
            }.padding(.top)
            
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
        .background(Color.white)
        .cornerRadius(30)
    }
}

var data = ["Revelance", "Newest", "Price(low to hight)", "Price(high to low)", "Sort by Specs", "Sort by Storage"]
