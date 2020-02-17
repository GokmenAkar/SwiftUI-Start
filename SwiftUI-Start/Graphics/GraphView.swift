//
//  GraphView.swift
//  SwiftUI-Start
//
//  Created by Developer on 17.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    var body: some View {
        BarGraph(reports: Report.all())
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
