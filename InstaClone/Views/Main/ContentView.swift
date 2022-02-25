//
//  ContentView.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/25/22.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  
    var body: some View {
      Group {
        if viewModel.userSession == nil {
          LoginView()
        } else {
            if let user = viewModel.currentUser {
                MainTabView(user: user)
            }
        }
        //if not logged in, show login
        
        // else, show main interface
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
