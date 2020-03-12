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
    @State private var presentSheet: Bool = false

    @State private var customPopup: Bool   = false
    @State private var showStatusBar: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Text("You need to take some actions or pass data")
                ActionSheetView(presentingActionSheet: $presentingActionSheet,
                                actionSheetData: $actionSheetData)
                Text("deyta: \(actionSheetData?.title ?? "data yok olm")")
                Text("Time for Alert")
                AlertHelperView(presentAlert: $presentAlert)
                ContextMenuHelper()
                
                Button("Show custom popup") {
                    self.customPopup.toggle()
                }
                
                Button("Show/Hide status bar") {
                    self.showStatusBar.toggle()
                }
            }.statusBar(hidden: showStatusBar)
            if $customPopup.wrappedValue {
                CustomPopupView(showingModal: $customPopup)
            }
        }
    }
}

struct ActionSheetView: View {
    let title: String = "Actions"
    let message: String = "Are you sure to continue?"
    
    @Binding var presentingActionSheet: Bool
    @Binding var actionSheetData: ActionSheetData?
    
    @State var name: ActionSheetData? = nil
    
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
            
            Button("Would you go to a sheet view?") {
                self.name = ActionSheetData(title: "Gökmen", message: "Choose an option:")
            }.sheet(item: $name) { data in
                SheetHelperView(name: data.title)
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

struct SheetHelperView: View {
    @Environment(\.presentationMode) var presentation
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, this is a sheet view. \(name)")
            Button("Now Dissmis Me") {
                self.presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct CustomPopupView: View {
    @Binding var showingModal: Bool
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.4)
                .edgesIgnoringSafeArea(.vertical)
            VStack(spacing: 20) {
                Text("Popup")
                    .bold().padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                Spacer()
                Button(action: {
                    self.showingModal = false
                }) {
                    Text("Close")
                }.padding()
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20).shadow(radius: 20)
        }
    }
}

struct ControlModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        ControlModifiersView()
    }
}
