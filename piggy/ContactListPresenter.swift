//
//  ContactListPresenter.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class ContactListPresenter: NSObject {
    var interactor: ContactListInteractorInput?
    var userInterface: ContactListViewInterface?
}

extension ContactListPresenter: ContactListModuleInterface {
    func addNewContact() {
        //contactListWireframe.presentAddContactInterface()
    }

    func updateView(referenceContactName: String?) {
        interactor?.findContacts(of: referenceContactName)
    }
}

extension ContactListPresenter: ContactListInteractorOutput {
    func foundContacts(of name: String, contacts: [ContactBalanceDeliverer]) {
        let viewModels = contacts.map { (contact) -> ContactBalanceViewModel in
            return ContactBalanceViewModel(name: contact.name,
                                           balance: String(contact.balance),
                                           balanceColor: UIColor.red)
        }

        userInterface?.showContacts(contacts: viewModels,
                                    title: "One-to-Me")
    }
}
