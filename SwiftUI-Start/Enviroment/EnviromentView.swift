//
//  EnviromentView.swift
//  SwiftUI-Start
//
//  Created by Developer on 14.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct EnviromentView: View {
    @EnvironmentObject var userSettings: UserSettings
        
    var body: some View {
        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)
            Button("Increment Score") {
                self.userSettings.score += 1
            }
            
            FancyScoreView()
        }
    }
}

struct EnviromentView_Previews: PreviewProvider {
    static var previews: some View {
        EnviromentView().environmentObject(UserSettings())
    }
}
