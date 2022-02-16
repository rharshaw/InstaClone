//
//  LoginView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/6/22.
//

import SwiftUI

struct LoginView: View {
  @State private var email = ""
  @State private var password = ""
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          Text("InstaClone")
            .font(.largeTitle)
            .foregroundColor(.white)
          
          VStack(spacing: 20) {
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
              .customTextFieldModifier()
            
            CustomSecureField(text: $password, placeholder: Text("Password"))
              .customTextFieldModifier()
          }
          
          HStack {
            Spacer()
            Button(action: {}) {
              Text("Forgot Password?")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top)
                .padding(.trailing, 28)
            }
          }
          
          Button(action: {
            viewModel.login(withEmail: email, password: password)
          }) {
            Text("Sign In")
              .font(.headline)
              .foregroundColor(.white)
              .frame(width: 360, height: 50)
              .background(.purple)
              .opacity(0.7)
              .clipShape(Capsule())
              .padding()
          }
          Spacer()
          
          NavigationLink(destination: RegistrationView().navigationBarHidden(true), label: {
            HStack {
              Text("Don't have an account?")
                .font(.system(size: 14))
              
              Text("Sign Up")
                .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.white)
          })
            .padding(.bottom, 16)
        }
        .padding(.top, -44)
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
