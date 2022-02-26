//
//  Constants.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/16/22.
//

import Foundation
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
