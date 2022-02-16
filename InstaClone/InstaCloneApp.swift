//
//  InstaCloneApp.swift
//  InstaClone
//
//  Created by Rian Harshaw on 1/25/22.
//

import SwiftUI
import Firebase

@main
struct InstaCloneApp: App {
  
  init() {
    FirebaseApp.configure()
  }
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
