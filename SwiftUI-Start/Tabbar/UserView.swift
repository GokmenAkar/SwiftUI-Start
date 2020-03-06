//
//  UserView.swift
//  SwiftUI-Start
//
//  Created by Developer on 6.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct UserView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 6) {
            HStack(alignment: .top) {
                Text(user.name)
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(.primary)
                Spacer()
                Text(user.username)
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
            }
            
            HStack(alignment: .top, spacing: 4) {
                HStack() {
                    Text("Email:")
                        .font(.system(size: 10))
                        .fontWeight(.thin)
                        .foregroundColor(.secondary)
                    Text(user.email)
                        .font(.system(size: 10))
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                }
                Spacer()
                HStack(alignment: .top) {
                    Text("Phone:")
                        .font(.system(size: 10))
                        .fontWeight(.thin)
                        .foregroundColor(.secondary)
                    Text(user.phone)
                        .font(.system(size: 10))
                        .fontWeight(.thin)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.trailing)
                }
            }
            
            HStack(alignment: .top) {
                Text("City:")
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                Text(user.address.city)
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Divider()
                    .frame(maxHeight: 20)
                Text("Street:")
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                Text(user.address.street)
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                .lineLimit(1)
                Divider()
                    .frame(maxHeight: 20)
                Text("Zipcode:")
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                Text(user.address.zipcode)
                    .font(.system(size: 10))
                    .fontWeight(.thin)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Spacer()
            }
            
        }.padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User.testUser())
            .previewLayout(.sizeThatFits)
        
    }
}
