//
//  InstagramStoryView.swift
//  SwiftUI-Start
//
//  Created by Developer on 23.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import Combine

struct InstagramStoryView: View {
    var imageNames:[String] = ["1","2","3","4","1","2","3"]
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 7, interval: 3.0)
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                    .animation(.none)
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices) { x in
                        LoadingReactangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                }.padding()
            }
            .onAppear { self.storyTimer.start() }
            .onDisappear {self.storyTimer.cancel() }
        }
    }

}

struct InstagramStoryView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramStoryView()
    }
}

struct LoadingReactangle: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)

                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
}

class StoryTimer: ObservableObject {
    
    @Published var progress: Double
    private var interval: TimeInterval
    private var max: Int
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    
    
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }
    
    func start() {
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max { newProgress = 0 }
            self.progress = newProgress
        })
    }
    
    func cancel() {
        cancellable = nil
    }
}
