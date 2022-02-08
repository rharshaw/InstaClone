//
//  PostGridView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/2/22.
//

import SwiftUI

struct PostGridView: View {
  
  private let items = [GridItem(), GridItem(), GridItem()]
  private let width = UIScreen.main.bounds.width / 3
  
    var body: some View {
    
      LazyVGrid(columns: items, spacing: 2, content: {
          ForEach(0..<9) { _ in
              NavigationLink(destination: FeedView()) {
                  Image("bryson")
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
              }
          }
      })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
