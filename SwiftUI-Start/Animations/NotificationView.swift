//
//  NotificationView.swift
//  SwiftUI-Start
//
//  Created by Developer on 20.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("Success").padding()
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width - 12)
            .background(Color.green)
            .cornerRadius(16)
          
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
