//
//  AddContactPresenter.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 08/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class AddContactPresenter: NSObject {
    var interactor: AddContactInteractorInput?
    var delegate: AddContactModuleDelegate?
    var userInterface: AddContactViewInterface?
}

extension AddContactPresenter: AddContactModuleInterface {
    func saveAddContactAction(name: String) {
        interactor?.saveNewContact(name: name)
    }

    func cancelAddContactAction() {
        delegate?.didCancelAddContactAction()
    }
}

extension AddContactPresenter: AddContactInteractorOutput {
    func savedNewContact(name: String) {
        delegate?.didSaveAddContactAction()
    }

    func failedSavingNewContact(name: String, error: NSError) {
        userInterface?.showErrorMessage(errorTitle: error.localizedDescription,
                                        errorMessage: error.localizedRecoverySuggestion)
    }
}
