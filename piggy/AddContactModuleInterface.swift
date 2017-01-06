//
//  AddContactModuleInterface.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 08/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

protocol AddContactModuleInterface {
    func saveAddContactAction(name: String)
    func cancelAddContactAction()
}

protocol AddContactModuleDelegate {
    func didCancelAddContactAction()
    func didSaveAddContactAction()
}

protocol AddContactInteractorInput {
    func saveNewContact(name: String)
}

protocol AddContactInteractorOutput {
    func savedNewContact(name: String)
    func failedSavingNewContact(name: String, error: NSError)
}

protocol AddContactViewInterface {
    func showErrorMessage(errorTitle: String, errorMessage: String?)
}

protocol AddContactDataManager {
    func addNewContact(_ contact: ContactEntity, completion: (Bool, NSError?) -> ())
}
