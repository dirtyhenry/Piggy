//
//  ContactListInteractor.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class ContactListInteractor: NSObject {
    var presenter: ContactListInteractorOutput?

}

extension ContactListInteractor: ContactListInteractorInput {
    func findContacts(of name: String?) {
        let contact1 = ContactBalanceDeliverer(name: "Aldo", balance: -50.00)
        let contact2 = ContactBalanceDeliverer(name: "Blaise", balance: +40.00)
        let contact3 = ContactBalanceDeliverer(name: "Coralie", balance: -5.00)

        presenter?.foundContacts(of: "Me", contacts: [contact1, contact2, contact3])
    }
}
