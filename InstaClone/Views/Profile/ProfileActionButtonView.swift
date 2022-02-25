//
//  ProfileActionButtonView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/4/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1))
            }
        } else {
            //follow and message button
            HStack {
                Button(action: {isFollowed ? viewModel.unfollow() : viewModel.follow()}) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .background(isFollowed ? .white : .blue)
                        .foregroundColor(isFollowed ? .black : .white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1))
                        
                }
                .cornerRadius(3)
                
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1))
                }
            }
        }
    }
}

