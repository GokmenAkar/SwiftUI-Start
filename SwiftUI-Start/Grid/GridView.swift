//
//  GridView.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct GridView: View {
    let cars = Car.all()
    @State var showSold: Bool = false

    var body: some View {
        return List {
            Toggle(isOn: $showSold) {
                Text("isSold")
                    .font(.largeTitle).bold()
                    .foregroundColor(.orange)
            }
            ForEach(cars.filter {$0.isSold == self.showSold}) { car in
                HStack {
                    Image(car.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100 , alignment: .center)
                        .clipShape(Circle())
                        .shadow(radius: 8)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    Text(String(format: "%.2f $", car.price))
                    Spacer()
                    Text(car.isSold ? "Sold" : "For Sale")
                        .foregroundColor(car.isSold ? .red : .green)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
