//
//  ListContactInteractor.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class ListContactInteractor: NSObject {
    var presenter: ListContactInteractorOutput?
    var dataManager: ListContactDataManager?
}

extension ListContactInteractor: ListContactInteractorInput {
    func findContacts(of name: String?) {
        if let dataManager = dataManager {
            let contacts = dataManager.fetchAllContacts(except: name)
            let safeContacts = contacts.map { ContactBalanceDeliverer(name: $0.name!, balance: 0.00) }
            presenter?.foundContacts(of: name, contacts: safeContacts)
        }
    }
}
