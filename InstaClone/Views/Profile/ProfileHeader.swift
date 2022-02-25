//
//  ProfileHeader.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/4/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel 
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
               Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Posts")
                    UserStatView(value: 6, title: "Followers")
                    UserStatView(value: 3, title: "Following")
                }
                .padding(.trailing, 16)
            }
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Blessed husband and father of 2")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top)
        }
    }
}

