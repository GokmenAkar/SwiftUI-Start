//
//  Hike.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct Hike {
    let name: String
    let imageURL: String
    let miles:  Double
}

extension Hike {
    static func all() -> [Hike] {
        return [
            Hike(name: "Tom", imageURL: "kiacar", miles: 6),
            Hike(name: "Sal", imageURL: "crown", miles: 5.8),
            Hike(name: "Gokmen sjkdhfksdj sdfj ksdjksjd kjsdfk jskfj skjfksd jskdfj sfhwerıpogfh a", imageURL: "crown", miles: 2.5)
        ]
    }
}
