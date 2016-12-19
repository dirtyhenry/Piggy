//
//  AddContactInteractor.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 08/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class AddContactInteractor: NSObject {
    var addContactManager: AddContactDataManager?
    var presenter: AddContactInteractorOutput?
}

extension AddContactInteractor: AddContactInteractorInput {
    func saveNewContact(name: String) {
        let newContactEntity = ContactEntity(name: name, isRoot: false)
        addContactManager?.addNewContact(newContactEntity, completion: { (error) in
            if let error = error {
                presenter?.failedSavingNewContact(name: name, error: error)
            } else {
                presenter?.savedNewContact(name: name)
            }
        })
    }
}
