//
//  BindingView.swift
//  SwiftUI-Start
//
//  Created by Developer on 13.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BindingView: View {
    let episode = Episode(name: "Macbreak Weekly", track: "WWDC 2019")
    
    @State private var isPlaying = false
    var body: some View {
        VStack {
            Text(self.episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)
            
            Text(self.episode.track)
                .foregroundColor(.secondary)
            
            PlayButton(isPlaying: $isPlaying)
        }
    }
}


struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
