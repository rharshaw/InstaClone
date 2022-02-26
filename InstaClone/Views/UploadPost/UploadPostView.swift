//
//  UploadPostView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/26/22.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {imagePickerPresented.toggle()}) {
                    VStack {
                        Image(systemName: "plus").font(.title).padding(.bottom, 4)
                        Text("Photo").font(.headline)
                    }
                    .padding(30)
                    .foregroundColor(.black)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding()
                }
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            } else if let image = postImage{
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption..", text: $captionText)
                }
                
                Button(action: {
                    guard let image = selectedImage else { return }
                    viewModel.uploadPost(caption: captionText, image: image) { _ in
                        captionText = ""
                        postImage = nil
                    }}) {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

