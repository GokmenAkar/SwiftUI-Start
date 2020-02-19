//
//  PhotoCaptureView.swift
//  SwiftUI-Start
//
//  Created by Developer on 19.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false),
                         image: .constant(Image("")))
    }
}
