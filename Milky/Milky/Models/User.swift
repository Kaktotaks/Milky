//
//  User.swift
//  Milky
//
//  Created by Леонід Шевченко on 11.11.2021.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    init(authData: Firebase.User) {
        uid = authData.uid
        email = authData.email ?? ""
    }
}
