//
//  Extensions.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/3/22.
//

import UIKit
import SwiftUI


struct CustomTF: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .padding()
      .background(Color(.init(white: 1, alpha: 0.15)))
      .cornerRadius(10)
      .foregroundColor(.white)
      .padding(.horizontal, 32)
  }
}

extension View {
  func customTextFieldModifier() -> some View {
    modifier(CustomTF())
  }
}

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
