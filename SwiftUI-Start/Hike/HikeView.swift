//
//  HikeView.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    let hikes = Hike.all()
    
    var body: some View {
        NavigationView {
            List(self.hikes, id: \.name) { hike in
                NavigationLink(destination: HikeDetail(hike: hike)) {
                    HikeCell(hike: hike)
                }
            }
            .navigationBarTitle("Hikes")
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView()
    }
}

struct HikeCell: View {
    let hike: Hike!
    
    var body: some View {
        HStack {
            Image(hike.imageURL)
                .resizable()
                .clipShape(Circle())
                .frame(width: 52, height: 52)
                .shadow(radius: 4)
                .overlay(Circle()
                    .stroke(Color.white,lineWidth:2))
            VStack(alignment: .leading) {
                Text(hike.name)
                    .fontWeight(.light)
                    .italic()
                    .underline(true, color: Color.gray)
                    .foregroundColor(.green)
                Text(String(format: "%.2f", hike.miles))
            }
        }
    }
}
