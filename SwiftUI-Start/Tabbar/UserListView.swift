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
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(destination: UserView(user: user)) {
                    UserView(user: user)
                }
            }
            .navigationBarTitle(Text("Users"))
        }
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
        UserListView(users: User.testUsers(testCount: 4))
    }
}
