//
//  TimerView.swift
//  SwiftUI-Start
//
//  Created by Developer on 14.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct FancyScoreView: View {
     @EnvironmentObject var userSettings: UserSettings
       
       var body: some View {
           VStack {
               Text("\(self.userSettings.score)")
               Button("Increment Score") {
                   self.userSettings.score += 1
               }.padding().background(Color.green)
           }.padding().background(Color.orange)
       }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
