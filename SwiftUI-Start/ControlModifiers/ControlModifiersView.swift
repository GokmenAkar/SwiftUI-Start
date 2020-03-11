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
    @State private var presentAlert: Bool = false
    var body: some View {
        VStack {
            Text("You need to take some actions or pass data")
            ActionSheetView(presentingActionSheet: $presentingActionSheet, actionSheetData: $actionSheetData)
            Text("deyta: \(actionSheetData?.title ?? "data yok olm")")
            Text("Time for Alert")
            AlertHelperView(presentAlert: $presentAlert)
            ContextMenuHelper()
        }
    }
}

struct ActionSheetView: View {
    let title: String = "Actions"
    let message: String = "Are you sure to continue?"
    
    @Binding var presentingActionSheet: Bool
    @Binding var actionSheetData: ActionSheetData?
    
    var body: some View {
        VStack {
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
            
            Button("Pass") {
                self.actionSheetData = ActionSheetData(title: "Options", message: "Choose an option:")
            }.actionSheet(item: $actionSheetData) { actionSheetMessage in
                ActionSheet(title: Text(actionSheetMessage.title))
            }
        }
    }
}

struct AlertHelperView: View {
    
    @Binding var presentAlert: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                self.presentAlert.toggle()
            }) {
                Text("can u show me some alert?").font(.largeTitle).fontWeight(.bold).foregroundColor(.gray).multilineTextAlignment(.center)
            }.alert(isPresented: $presentAlert) {
                Alert(title: Text("Selam"), message: Text("Where is my alert?"))
            }
        }
    }
}

struct ContextMenuHelper: View {
    var body: some View {
        Image(systemName: "questionmark.diamond.fill")
            .font(.title)
            .foregroundColor(.orange)
            .frame(width: 44, height: 44)
        .contextMenu {
            Button(action: {}) {
                Text("Add color")
                Image(systemName: "eyedropper.full")
            }
            Button(action: {}) {
                HStack {
                    Image(systemName: "circle.lefthalf.fill")
                    Text("Change constrast")
                }
            }
        }
    }
}

struct ControlModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ControlModifiersView()
    }
}
