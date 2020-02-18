//
//  ModalView.swift
//  SwiftUI-Start
//
//  Created by Developer on 18.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    @State private var flagViewModel: FlagViewModel = FlagViewModel()
    
    var body: some View {
        List {
            Text(flagViewModel.country)
            ForEach(flagViewModel.flags, id: \.self) { flag in
                HStack {
                    Text(flag).font(.custom("Arial", size: 64))
                    Spacer()
                }.onTapGesture {
                    self.flagViewModel.flag = flag
                    self.flagViewModel.showModel.toggle()
                }
            }
        }
        .sheet(isPresented: $flagViewModel.showModel) {
            FlagDetailView(flagViewModel: self.$flagViewModel)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
