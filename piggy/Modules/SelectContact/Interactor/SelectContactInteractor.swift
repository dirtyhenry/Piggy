//
//  SelectContactSelectContactInteractor.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

struct SelectContactPresenterModel {
    let name: String
}

class SelectContactInteractor: SelectContactInteractorInput {
    var dataManager: ListContactDataManager?
    weak var output: SelectContactInteractorOutput!

    func findContacts(forEvent: String?) {
        if let dataManager = dataManager {
            let contacts = (forEvent == nil) ? dataManager.fetchAllContacts() : dataManager.fetchContactsForEvent(event: forEvent!)

            // FIXME: this looks a lot like list contact module
            let safeContacts = contacts.map { SelectContactPresenterModel(name: $0.name!) }
            output?.foundContacts(contacts: safeContacts)
        }
    }
}
