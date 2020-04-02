//
//  ViewPreferences.swift
//  SwiftUI-Start
//
//  Created by Developer on 21.03.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ExampleView: View {
    @State private var cards: [String] = [
           "Lorem", "ipsum", "is", "placeholder", "text", "!!!"
       ]
     var body: some View {
        GGridView(cards) { card in
            Text(card)
                .frame(width: 120, height: 120)
                .background(Color.orange)
                .cornerRadius(8)
                .padding(4)
        }
    }
}

struct GGridView<Data: RandomAccessCollection, ElementView: View>: View where Data.Element: Hashable {
    private let data: Data
    private let itemView: (Data.Element) -> ElementView
    
    @State private var preferences: [Data.Element: CGRect] = [:]
    
    init(_ data: Data, @ViewBuilder itemView: @escaping (Data.Element) -> ElementView) {
        self.data = data
        self.itemView = itemView
    }
    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .topLeading) {
//                ...
//            }
//            .onPreferenceChange(SizePreferences<Data.Element>.self) { sizes in
//                var newPreferences: [Data.Element: CGRect] = [:]
//                var bounds: [CGRect] = []
//                for item in self.data {
//                    let size = sizes[item, default: .zero]
//                    let rect: CGRect
//                    if let lastBounds = bounds.last {
//                        if lastBounds.maxX + size.width > geometry.size.width {
//                            let origin = CGPoint(x: 0, y: lastBounds.maxY)
//                            rect = CGRect(origin: origin, size: size)
//                        } else {
//                            let origin = CGPoint(x: lastBounds.maxX, y: lastBounds.minY)
//                            rect = CGRect(origin: origin, size: size)
//                        }
//                    } else {
//                        rect = CGRect(origin: .zero, size: size)
//                    }
//                    bounds.append(rect)
//                    newPreferences[item] = rect
//                }
//                self.preferences = newPreferences
//            }
//        }
//    }
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(self.data, id: \.self) { item in
                    self.itemView(item)
                    .alignmentGuide(.leading) { (_) in
                            -self.preferences[item, default: .zero].origin.x
                    }
                    .alignmentGuide(.top) { _ in
                        -self.preferences[item, default: .zero].origin.y
                    }
                    .anchorPreference(key: SizePreferenceKey<Data.Element>.self,     value: .bounds) {
                        [item: geometry[$0].size]
                    }
                }
            }
            .onPreferenceChange(SizePreferenceKey<Data.Element>.self) { sizes in
                var newPreferences: [Data.Element: CGRect] = [:]
                var bounds: [CGRect] = []
                
                for item in self.data {
                    let size = sizes[item, default: .zero]
                    let rect: CGRect
                    if let lastBounds = bounds.last {
                        if lastBounds.maxX + size.width > geometry.size.width {
                            let origin = CGPoint(x: 0, y: lastBounds.maxY)
                            rect = CGRect(origin: origin, size: size)
                        } else {
                            let origin = CGPoint(x: lastBounds.maxX, y: lastBounds.minY)
                            rect = CGRect(origin: origin, size: size)
                        }
                    } else {
                        rect = CGRect(origin: .zero, size: size)
                    }
                    bounds.append(rect)
                    newPreferences[item] = rect
                }
                self.preferences = newPreferences
            }
        }
    }
}

struct ViewPreferences_Previews: PreviewProvider {
    static var previews: some View {
       ExampleView()
    }
}


struct BoundsPreferenceKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue()
    }
}

struct SizePreferenceKey<Item: Hashable>: PreferenceKey {
    static var defaultValue: [Item: CGSize] { [:] }
    static func reduce(value: inout [Item : CGSize], nextValue: () -> [Item : CGSize]) {
        value.merge(nextValue()) { $1 }
    }
}
