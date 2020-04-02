//
//  KeyboardHeightTestView.swift
//  SwiftUI-Start
//
//  Created by Developer on 2.04.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI
import Combine

struct KeyboardHeightTestView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                ForEach(0..<20) { _ in
                    Text("hehe")
                        .padding()
                }
                TextField("Enter a message", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Rectangle().frame(height: 300)
            }
        }
        .padding()
        .keyboardAdaptive()
    }
}

struct KeyboardHeightTestView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardHeightTestView()
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, self.bottomPadding)
                .onReceive(Publishers.keyboardHeight) { kHeight in
                    let keyboardTop = geometry.frame(in: .global).height - kHeight
                    let focusedKeyboardBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.bottomPadding = max(0, focusedKeyboardBottom - keyboardTop - geometry.safeAreaInsets.bottom)
                        
            }
        }
    }
}
extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}

extension Publishers {
    
      static var keyboardHeight: AnyPublisher<CGFloat, Never> {
          // 2.
          let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
              .map { $0.keyboardHeight }
          
          let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
              .map { _ in CGFloat(0) }
          
          // 3.
          return MergeMany(willShow, willHide)
              .eraseToAnyPublisher()
      }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }

    private static weak var _currentFirstResponder: UIResponder?

    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }

    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}
