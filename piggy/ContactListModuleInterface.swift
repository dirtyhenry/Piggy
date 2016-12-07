//
//  ContactListModuleInterface.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

protocol ContactListModuleInterface {
    func addNewContact()
    func updateView(referenceContactName: String?)
}

protocol ContactListInteractorInput {
    func findContacts(of name: String?)
}

protocol ContactListInteractorOutput {
    func foundContacts(of name: String, contacts: [ContactBalanceDeliverer])
}

protocol ContactListViewInterface {
    func showNoContentMessage(title: String)
    func showContacts(contacts: [ContactBalanceViewModel], title: String)
}
