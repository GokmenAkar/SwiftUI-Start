//
//  EquatableContentView.swift
//  SwiftUI-Start
//
//  Created by Developer on 25.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI



extension Int {
    var isEven: Bool { return self % 2 == 0 }
    var isOdd: Bool { return self % 2 != 0 }
}

struct EquatableContentView: View {
    
    @State private var n = 3
    
    var body: some View {
        VStack {
            NumberParity(number: n).equatable()
            
            Button("New Random Number") {
                self.n = Int.random(in: 1...1000)
            }.padding(.top, 80)
            
            Text("\(n)")
        }
    }
}

struct EquatableContentView_Previews: PreviewProvider {
    static var previews: some View {
        EquatableContentView()
    }
}

struct NumberParity: View, Equatable {
    
    let number: Int
    
    var body: some View {
        print("Body computed for number = \(number)")

        return VStack {
            if number.isOdd {
                Text("ODD")
            } else {
                Text("EVEN")
            }
        }
        .foregroundColor(.white)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(self.number.isOdd ? Color.red : Color.green)
        )
    }
    
    static func == (lhs: NumberParity, rhs: NumberParity) -> Bool {
         lhs.number.isOdd == rhs.number.isOdd
    }
}
