//
//  RegistrationView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/6/22.
//

import SwiftUI

struct RegistrationView: View {
  
  @State private var email = ""
  @State private var password = ""
  @State private var username = ""
  @State private var fullname = ""
  @State private var selectedImage: UIImage?
  @State private var image: Image?
  @State private var imagePickerPresented = false
  @Environment(\.presentationMode) var mode
  @EnvironmentObject var viewModel: AuthViewModel
    
  var body: some View {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          ZStack {
          if let image = image {
              image
              .renderingMode(.original)
              .resizable()
              .scaledToFill()
              .frame(width: 120, height: 120)
              .clipShape(Circle())
              .padding(.bottom, 30)
          } else {
            Button(action: { imagePickerPresented.toggle() }) {
            VStack {
              Image(systemName: "plus").font(.title).padding(.bottom, 4)
              Text("Photo").font(.headline)
            }
            .foregroundColor(.white)
            .padding(30)
            .overlay(
              Circle()
                .stroke(Color.white, lineWidth: 2)
            )
            .padding()
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
              ImagePicker(image: $selectedImage)
              }
            }
          }
          
          VStack(spacing: 20) {
            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
              .customTextFieldModifier()
            
            CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
              .customTextFieldModifier()
            
            CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
              .customTextFieldModifier()
           
            CustomSecureField(text: $password, placeholder: Text("Password"))
              .customTextFieldModifier()
          }
          
          Button(action: {}) {
            Text("Sign Up")
              .font(.headline)
              .foregroundColor(.white)
              .frame(width: 360, height: 50)
              .background(.purple)
              .opacity(0.7)
              .clipShape(Capsule())
              .padding()
          }
          Spacer()
          
          Button(action: { mode.wrappedValue.dismiss() }) {
            HStack {
              Text("Already have an account?")
                .font(.system(size: 14))
              
              Text("Sign In")
                .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.white)
          }
            .padding(.bottom, 16)
        }
      }
    }
  }

  extension RegistrationView {
    func loadImage() {
      guard let selectedImage = selectedImage else { return }
      image = Image(uiImage: selectedImage)
    }
  }

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
