//
//  MainTabView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/26/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
      NavigationView {
        TabView {
          FeedView()
            .tabItem {
              Image(systemName: "house")
            }
          SearchView()
            .tabItem {
              Image(systemName: "magnifyingglass")
            }
          UploadPostView()
            .tabItem {
              Image(systemName: "plus.square")
            }
          NotificationsView()
            .tabItem {
              Image(systemName: "heart")
            }
          ProfileView()
            .tabItem {
              Image(systemName: "person")
            }
        }
        .navigationBarTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: logoutButton)
        .accentColor(.purple)
      }
    }
  
  var logoutButton: some View {
    Button(action: { AuthViewModel.shared.signout() } ) {
      Text("Logout")
        .foregroundColor(.black)
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
