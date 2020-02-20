//
//  SearchView.swift
//  SwiftUI-Start
//
//  Created by Developer on 19.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    let names = ["Azam", "Gokmen", "Alex", "Shio", "John", "Kemal", "Istanbul"]
    
    @State private var searchTerm: String = ""
    var body: some View {
        List {
            SearchBar(text: $searchTerm)
             
            ForEach(names.filter {
                self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)
            }, id: \.self) { name in
                Text(name)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
