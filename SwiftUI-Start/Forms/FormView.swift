//
//  FormView.swift
//  SwiftUI-Start
//
//  Created by Developer on 18.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct FormView: View {
    @State private var scheduled: Bool = false
    @State private var manuallyEnabledTill: Bool = false
    @State private var colorTemperature: CGFloat = 0.5
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bildirim ayarlarınızı buradan değiştirebilirsiniz").lineLimit(nil)) {
                    Toggle(isOn: $scheduled) {
                        Text("Scheduled")
                    }
                    HStack {
                        VStack {
                            Text("From")
                            Text("To")
                        }
                        Spacer()
                        NavigationLink(destination: Text("Scheduled Settings")) {
                            VStack {
                                Text("Sunset") .foregroundColor(.blue)
                                Text("Sunrise").foregroundColor(.blue)
                            }
                        }.fixedSize()
                    }
                }
                
                Section(header: Text("")) {
                    Toggle(isOn: $manuallyEnabledTill) {
                        Text("Manually Enable Till Tomorrow")
                    }
                }
                
                Section(header: Text("COLOR TEMPERATURE").padding()) {
                    HStack {
                        Text("Less Warm")
                        Slider(value: $colorTemperature)
                        Text("More Warm")
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
