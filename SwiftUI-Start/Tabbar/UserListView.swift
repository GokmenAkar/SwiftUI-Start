//
//  UserView.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    
    @State var users: [User] = [User]()
    
    var body: some View {
        Text("Hello world")
            
            .onAppear {
                let request = UserRequest()
                Service.shared.getRequest(request: request) { (dataUser, error) in
                    self.users = dataUser!
                }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
