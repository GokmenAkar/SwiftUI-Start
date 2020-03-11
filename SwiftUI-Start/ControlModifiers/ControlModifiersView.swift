//
//  ControlModifiersView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 11.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
struct ActionSheetData: Identifiable {
    var id = UUID()
    let title: String
    let message: String
}
struct ControlModifiersView: View {
    @State private var presentingActionSheet: Bool = false
    @State private var actionSheetData: ActionSheetData? = nil
    
    var body: some View {
        VStack {
            
            Text("You need to take some actions")
            ActionSheetView(presentingActionSheet: $presentingActionSheet)
            Text("Pass Data to Action Sheet")
            Button("Pass") {
                self.actionSheetData = ActionSheetData(title: "Options", message: "Choose an option:")
            }.actionSheet(item: $actionSheetData) { actionSheetMessage in
                ActionSheet(title: Text(actionSheetMessage.title))
            }
        }
    }
}

struct ActionSheetView: View {
    let title: String = "Actions"
    let message: String = "Are you sure to continue?"
    
    @Binding var presentingActionSheet: Bool
    
    var body: some View {
        Button("Show Actions") {
            self.presentingActionSheet.toggle()
        }
        .actionSheet(isPresented: $presentingActionSheet) {
            ActionSheet(title: Text("Actions"), message: Text("Are you sure to continue?"), buttons: [
                .default(Text("Continue")),
                .destructive(Text("Delete")),
                .cancel(Text("Close"))
            ])
        }
    }
}

struct ControlModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ControlModifiersView()
    }
}
