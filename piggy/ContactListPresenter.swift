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
    func foundContacts(of name: String?, contacts: [ContactBalanceDeliverer]) {
        let positiveBalanceColor = UIColor(red: 0.0, green: 0.67, blue: 0.0, alpha: 1.0)
        let negativeBalanceColor = UIColor.red
        
        let viewModels = contacts.map { (contact) -> ContactBalanceViewModel in
            return ContactBalanceViewModel(name: contact.name,
                                           balance: String(contact.balance),
                                           balanceColor: contact.balance >= 0.0 ? positiveBalanceColor : negativeBalanceColor)
        }
        
        let unwrappedName = name ?? "Me"
        userInterface?.showContacts(contacts: viewModels,
                                    title: "One-to-\(unwrappedName)")
    }
}
