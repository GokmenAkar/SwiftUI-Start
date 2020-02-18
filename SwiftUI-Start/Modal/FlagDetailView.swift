//
//  FlagDetailView.swift
//  SwiftUI-Start
//
//  Created by Developer on 18.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct FlagDetailView: View {
    let flag: String
    @Binding var country: String
    @Binding var showModal: Bool
    var body: some View {
        VStack {
            Text(flag).font(.custom("Arial", size: 200))
            TextField("Enter country name", text: $country)
                .padding()
                .fixedSize()
            Button("Submit") {
                self.showModal.toggle()
            }
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flag: "TR", country: .constant(""), showModal: .constant(false))
    }
}
