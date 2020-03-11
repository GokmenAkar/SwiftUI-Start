//
//  ControlModifiersView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 11.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ControlModifiersView: View {
    @State private var presentingActionSheet: Bool = false
    var body: some View {
        VStack {
            Button("Show Action Sheet") {
                self.presentingActionSheet.toggle()
            }
            .actionSheet(isPresented: $presentingActionSheet) {
                ActionSheet(title: Text("Action Sheet"), message: Text("Are you sure?"), buttons: [
                    .default(Text("Continue")),
                    .destructive(Text("Delete")),
                    .cancel(Text("Close"))
                    ])
            }
        }
    }
}

struct ControlModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ControlModifiersView()
    }
}
