//
//  ListContactModuleInterface.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

protocol ListContactModuleInterface {
    func addNewContact()
    func updateView(referenceContactName: String?)
}

protocol ListContactInteractorInput {
    func findContacts(of name: String?)
}

protocol ListContactInteractorOutput {
    func foundContacts(of name: String?, contacts: [ContactBalanceDeliverer])
}

protocol ListContactViewInterface {
    func showNoContentMessage(title: String)
    func showContacts(contacts: [ContactBalanceViewModel], title: String)
    func addNewContact()
}

protocol ListContactDataManager {
    func fetchAllContacts(except: String?) -> [Contact]
}
