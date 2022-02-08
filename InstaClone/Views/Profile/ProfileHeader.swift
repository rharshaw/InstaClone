//
//  ProfileHeader.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/4/22.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("rian")
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
            Text("Rian Harshaw")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Blessed husband and father of 2")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
              ProfileActionButtonView()
                
                Spacer()
            }
            .padding(.top)
        }
    }
}



struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
