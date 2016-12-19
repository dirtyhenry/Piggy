//
//  AuthenticationFirebaseManager.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 19/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthenticationFirebaseManager {
//    var handle
//    
//    init() {
//        handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
//            //...
//        }
//    }
}

extension AuthenticationFirebaseManager: SignInDataManager {
    func createNewUser(username email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                //...
            } else {
                
            }
        }
    }
}
