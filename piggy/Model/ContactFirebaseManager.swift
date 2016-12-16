//
//  ContactFirebaseManager.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 08/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Firebase

/// Manager for Firebase data management
class ContactFirebaseManager: NSObject {
    let ref = FIRDatabase.database().reference()
}

extension ContactFirebaseManager: AddContactDataManager {
    func addNewContact(_ contact: ContactEntity, completion: (Bool, NSError) -> ()) {
        ref.child("users").child("dirtyhenry").child("contacts").setValue(["username": contact.name])
    }
}
