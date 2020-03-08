//
//  MarketRequest.swift
//  SwiftUI-Start
//
//  Created by GÖKMEN AKAR on 8.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class MarketRequest: BaseServiceRequest<StocksDaily> {
    override var baseURL: String {
        return "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=NSE:YESBANK&apikey=AVAWECQGQK8105NK&datatype=json"
    }
}
