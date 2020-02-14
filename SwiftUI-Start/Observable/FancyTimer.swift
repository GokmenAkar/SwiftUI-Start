//
//  FancyTimer.swift
//  SwiftUI-Start
//
//  Created by Developer on 14.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
 
class FancyTimer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.value += 1
        }
    }
}
