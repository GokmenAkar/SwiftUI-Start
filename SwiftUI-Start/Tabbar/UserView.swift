//
//  UserView.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
    @Binding var user: User
    
    var body: some View {
        VStack {
            Text("")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: .constant(User.testUser()))
        
    }
}
