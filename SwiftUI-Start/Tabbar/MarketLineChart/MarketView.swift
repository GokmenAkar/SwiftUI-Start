//
//  MarketView.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct MarketView: View {
    
    @ObservedObject var marketViewModel = MarketViewModel()
    
    var body: some View {
        LineView(data: marketViewModel.prices, title: "YES BANK", price: "\(marketViewModel.currentPrice) USD").padding()
            .onAppear {
                withAnimation { 
                    self.marketViewModel.getStockData()
                }
                
        }
    }
}

//struct PacManView: View {
//    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x: 100, y: 100))
//            path.addArc(center: CGPoint(x: 100, y: 100), radius: 90, startAngle: .degrees(0), endAngle: .degrees(60), clockwise: true)
//        }
//        .fill(Color("BackgroundColor"))
//        .frame(width: 200, height: 200, alignment: .center)
//        .shadow(color: Color("LightShadow"), radius: 8, x: -18, y: -18)
//        .shadow(color: Color("DarkShadow"), radius: 8, x: 20, y: 20)
//    }
//}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}

//struct PacManView_Previews: PreviewProvider {
//    static var previews: some View {
//        PacManView().previewLayout(.sizeThatFits)
//    }
//}
