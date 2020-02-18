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
    var body: some View {
        Button("Show Modal") {
            self.showModal.toggle()
        }.sheet(isPresented: $showModal) {
            Text("I am a Modal")
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
