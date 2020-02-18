//
//  FlagDetailView.swift
//  SwiftUI-Start
//
//  Created by Developer on 18.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct FlagDetailView: View {
    @Binding var flagViewModel: FlagViewModel
    
    var body: some View {
        VStack {
            Text(flagViewModel.flag).font(.custom("Arial", size: 200))
            TextField("Enter country name", text: $flagViewModel.country)
                .padding()
                .fixedSize()
            Button("Submit") {
                self.flagViewModel.showModel.toggle()
            }
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flagViewModel: .constant(FlagViewModel()))
    }
}
