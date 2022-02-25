//
//  AuthViewModel.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/7/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Unable to sign user in due to \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
        print("User successfully logged in")
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                self.userSession = user
                self.fetchUser()
                print("DEBUG: Successfully registered user")
                
                let data = ["email": email, "username": username,
                            "fullname": fullname, "profileImageUrl": imageUrl,
                            "uid" : user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("DEBUG: Successfully uploaded user data")
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
}
