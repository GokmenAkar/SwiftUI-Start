//
//  ContentView.swift
//  SwiftUI-Start
//
//  Created by Developer on 12.02.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showShape: Bool = false
    var body: some View {
        VStack(spacing: 12) {
            
            
            HStack {
                OrangeRectangle(color: .red)
                    .overlay(
                        Text("Left Shape")
                            .foregroundColor(.black)
                )
                
                if showShape {
                    OrangeRectangle(color: .yellow)
                        .overlay(
                            Text("Right Shape")
                    )
                }
            }
            
            OrangeRectangle(color: .gray).padding(.horizontal, 50).zIndex(1)
            OrangeRectangle(color: .purple).scaleEffect(1.5).padding(.horizontal, 50)
            OrangeRectangle(color: .gray).padding(.horizontal, 50)
            
            Text("Gelibolu")
                .foregroundColor(.white)
                .padding(12)
                .padding(.vertical, 0)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.purple))
            Toggle("", isOn: $showShape).toggleStyle(CheckMarkToggleStyle(label: "Check on/off", color: Color.red))
            Toggle("", isOn: $showShape).toggleStyle(ColoredToggleStyle(label: "hehe", onColor: .red, offColor: .blue, thumbColor: .white))
            Button("show/hide") {
                self.showShape.toggle()
            }
            .padding()
        }
    }
}

struct OrangeRectangle: View {
    let color: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 20).foregroundColor(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CheckMarkToggleStyle: ToggleStyle {
    var label = ""
    var color = Color.primary
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Button(action: { configuration.isOn.toggle() }) {
                Image(systemName: configuration.isOn
                    ? "checkmark.square.fill"
                    : "square.fill")
                    .foregroundColor(color)
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color.green
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() }) {
                RoundedRectangle(cornerRadius: 16, style: .circular).fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                )
            }
        }
    }
}
