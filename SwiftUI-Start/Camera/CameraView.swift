//
//  CameraView.swift
//  SwiftUI-Start
//
//  Created by Developer on 19.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            image?.resizable().scaledToFit()
            
            Button("Open Camera") {
                self.showImagePicker = true
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }.sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
