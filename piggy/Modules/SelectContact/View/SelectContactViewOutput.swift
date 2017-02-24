//
//  SelectContactSelectContactViewOutput.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

protocol SelectContactViewInput {
    func updateContactList(contacts: [SelectContactViewModel])
}

protocol SelectContactViewOutput {
    func didTapAddContact()

    func didSelectContact(name: String)
    func didUnselectContact(name: String)

    func viewWillAppear()
}
