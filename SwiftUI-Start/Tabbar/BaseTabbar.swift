//
//  BaseTabbar.swift
//  SwiftUI-Start
//
//  Created by Developer on 28.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct BaseTabbar: View {
    var body: some View {
        TabView {
            VStack {
                Text("hehe")
            }
            .tabItem {
                Text("Tab 1")
            }
            
            HikeDetail(hike: Hike.all().first!)
                .tabItem {
                    
                        Text("Tab hike")
                
            }
        }
    }
}

struct BaseTabbar_Previews: PreviewProvider {
    static var previews: some View {
        BaseTabbar()
    }
}
