//
//  ModalView.swift
//  SwiftUI-Start
//
//  Created by Developer on 18.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    @State private var showModal: Bool = false
    @State private var selectedFlag: String = ""
    
    let flags = ["🇹🇷","🇺🇸","🇯🇵","🇹🇷","🇺🇸","🇯🇵","🇹🇷","🇺🇸","🇯🇵"]
    
    var body: some View {
        List {
            ForEach(0..<flags.count) { index in
                HStack {
                    Text(self.flags[index]).font(.custom("Arial", size: 48))
                    Text("Bayrak \(index)")
                }.onTapGesture {
                    self.showModal.toggle()
                    self.selectedFlag = self.flags[index]
                }
            }
        }
        .sheet(isPresented: $showModal) {
            HStack {
                Text("Selected Flag")
                Text(self.selectedFlag).font(.custom("Arial", size: 56))
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
