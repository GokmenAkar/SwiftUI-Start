//
//  ContentView.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem: String = ""
    let animals = ["g", "t", "c", "ho"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Picker(selection: $selectedItem, label: Text("Başlık")) {
                    Text("1")
                    Text("2")
                    }.pickerStyle(SegmentedPickerStyle())
                
                Text("hehe")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Text("haha").font(.title)
                    .foregroundColor(.yellow)
                Text("tete")
                    .foregroundColor(.red)
                Text("rere")
                    .underline(true, color: .blue)
                Text("KIAFAN")
                Image("kiafan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding(.all)
                    .foregroundColor(.red)
                    .border(Color.red, width: 4)
                HStack {
                    Text("evev")
                    Text("hehe")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
