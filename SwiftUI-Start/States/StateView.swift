//
//  StateView.swift
//  SwiftUI-Start
//
//  Created by Developer on 13.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct StateView: View {
    @State var name: String = "Leonardo"
    
    @State var changeName: Bool = false
    
    var body: some View {
        VStack {
            Text(name)
                .font(changeName ? .largeTitle : .headline)
            Button(action: {
                self.changeName.toggle()
                self.name = self.changeName ? "Leonardo" : "Tarkan"
            }) {
                Text("Change Name")
            }
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
