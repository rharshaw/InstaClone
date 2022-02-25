//
//  ProfileViewModel.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/22/22.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
            print("DEBUG: Successfully followed \(self.user.username)")
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
            print("DEBUG: Successfully unfollowed \(self.user.username)")
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
