//
//  NotificationFormView.swift
//  SwiftUI-Start
//
//  Created by Developer on 18.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct NotificationFormView: View {
    
    @State private var notifications: [String] = [String]()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    HStack {
                        Text("Previews")
                        Spacer()
                        NavigationLink(destination: Text("")) {
                            Text("Always").foregroundColor(.gray)
                        }.fixedSize()
                    }
                }
                
                Section(header: Text("Notification previews wiill be whether the iPhone is locked or unlocked").foregroundColor(.gray)) {
                    NavigationLink(destination: Text("")) {
                        Text("Siri Suggestions")
                    }
                }
                
                Section(header:
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Choose while apps can suggest shortcuts on the lock screen")
                        Text("NOTIFICATION STYLE")
                    }) {
                        ForEach(notifications, id: \.self) { title in
                            HStack {
                                Image("1").resizable().frame(width: 32, height: 32)
                                    .clipShape(Circle())
                                    .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 2))
                                    .shadow(radius: 2)
                                    .padding([.top, .bottom], 4)
                                Text(title)
                            }
                    }
                }
            }
            .navigationBarTitle("Notification Settings")
        }.onAppear {
            self.populateNotificationText()
        }
    }
    
    func populateNotificationText() {
        for i in 0...20 {
            self.notifications.append("Notification \(i)")
        }
    }
}

struct NotificationFormView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationFormView()
    }
}
