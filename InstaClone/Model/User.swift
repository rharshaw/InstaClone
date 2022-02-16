//
//  User.swift
//  InstaClone
//
//  Created by Rian Harshaw on 2/16/22.
//

import FirebaseFirestoreSwift

struct User: Decodable {
  let username: String
  let email: String
  let profileImageUrl: String
  let fullname: String
  @DocumentID var id: String?
}
