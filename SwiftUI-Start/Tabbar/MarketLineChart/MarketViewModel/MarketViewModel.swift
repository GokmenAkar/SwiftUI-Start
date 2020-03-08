//
//  MarketViewModel.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class MarketViewModel: ObservableObject {
    @Published var prices = [Double]()
    @Published var currentPrice = "...."
    
    func getStockData() {
            
//        var numberArray = [0.2, 0.4, 1.0, 2.0, 5.0 , 7.0, 3.4, 2.8, 3.5, 5.7, 8.9, 12.0, 15.0, 15.2, 17.2, 20.3, 25.5, 27.9, 24.0, 21.3, 21.0, 17.0, 16.5, 16.2, 15.9, 15.0, 14.0, 12.0, 11.5, 10.2]()
//
//
//        prices = numberArray

        let marketRequest = MarketRequest()

        Service.shared.getRequest(request: marketRequest) { (stockResponse, error) in
            var stockPrices = [Double]()

            let orderedDates =  stockResponse!.timeSeriesDaily?.sorted{
                guard let d1 = $0.key.stringDate, let d2 = $1.key.stringDate else { return false }
                return d1 < d2
            }

            guard let stockData = orderedDates else {return}

            for (_, stock) in stockData{
                if let stock = Double(stock.close){
                    if stock > 0.0{
                        stockPrices.append(stock)
                    }
                }
            }

            DispatchQueue.main.async{
                self.prices = stockPrices
                self.currentPrice = stockData.last?.value.close ?? "..."
            }
        }
        
    }
}

extension String {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    var stringDate: Date? {
        return String.shortDate.date(from: self)
    }
}
