//
//  FeedCell.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/26/22.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
      VStack(alignment: .leading) {
        
        // User Info
  
        HStack {
          Image("rian")
            .resizable()
            .scaledToFill()
            .frame(width: 36, height: 36)
            .clipped()
            .cornerRadius(18)
          
          Text("Rian")
            .font(.system(size: 14, weight: .semibold))
        }
        .padding([.leading, .bottom], 8)
        
        // Post Image
        
        Image("bryson")
          .resizable()
          .scaledToFill()
          .frame(maxHeight: 440)
          .clipped()
        
        
        
        // Action Buttons
        
        HStack(spacing: 10) {
          Button(action: {}) {
            Image(systemName: "heart")
              .resizable()
              .scaledToFill()
              .frame(width: 20, height: 20)
              .font(.system(size: 20))
              .padding(4)
          }
          Button(action: {}) {
            Image(systemName: "bubble.right")
              .resizable()
              .scaledToFill()
              .frame(width: 20, height: 20)
              .font(.system(size: 20))
              .padding(4)
          }
          Button(action: {}) {
            Image(systemName: "paperplane")
              .resizable()
              .scaledToFill()
              .frame(width: 20, height: 20)
              .font(.system(size: 20))
              .padding(4)
          }
        }
        .padding(.leading, 4)
        .foregroundColor(.black)
        
        // Likes
        
        Text("6 likes")
          .font(.system(size: 14, weight: .semibold))
          .padding(.leading, 8)
          .padding(.bottom, 2)
        
        // Caption
        
        HStack {
          Text("Rian")
            .font(.system(size: 14, weight: .semibold)) +
            Text(" Me and my little guy")
            .font(.system(size: 15))
        }
        .padding(.horizontal, 8)
        Text("2d")
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .padding(.leading, 8)
          .padding(.top, -2)
      }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
