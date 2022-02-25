//
//  ProfileView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/26/22.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user) 
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                PostGridView()
            }
            .padding(.top)
        }
    }
}


