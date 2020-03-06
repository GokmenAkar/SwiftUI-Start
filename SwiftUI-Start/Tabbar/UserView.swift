//
//  UserView.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Text("Hello world")
            .onAppear {
                let request = ArticleRequest()
                Service.shared.getRequest(request: request) { (users, error) in
                    print(users, error)
                }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
