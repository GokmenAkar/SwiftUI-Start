//
//  PlayButton.swift
//  SwiftUI-Start
//
//  Created by Developer on 14.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import Combine

struct PlayButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Text("Play")
        }
    }
}
