//
//  SelectContactSelectContactPresenter.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

struct SelectContactViewModel {
    let name: String
    let selected: Bool
}

class SelectContactPresenter: SelectContactModuleInput, SelectContactViewOutput, SelectContactInteractorOutput {
    var view: SelectContactViewInput!
    var interactor: SelectContactInteractorInput!
    var router: SelectContactRouterInput!
    var currentSelection: [String]
    var didChangeSelection: ([String]) -> () = { _ in }

    init() {
        currentSelection = []
    }

    func setCurrentSelection(currentSelection: [String]) {
        self.currentSelection = currentSelection
    }

    func viewIsReady() {
        interactor.findContacts(forEvent: nil)
    }

    func foundContacts(contacts: [SelectContactPresenterModel]) {
        let viewModels = contacts.map { (contact) -> SelectContactViewModel in
            return SelectContactViewModel(name: contact.name,
                                          selected: currentSelection.contains(contact.name))
        }
        view?.updateContactList(contacts: viewModels)
    }

    func updateView() {
        interactor?.findContacts(forEvent: nil)
    }

    internal func addContactToCurrentSelection(contactToAdd: String) {
        if !currentSelection.contains(contactToAdd) {
            self.currentSelection.append(contactToAdd)
        }
    }

    internal func removeContactToCurrentSelection(contactToRemove: String) {
        if let index = currentSelection.index(of: contactToRemove) {
            self.currentSelection.remove(at: index)
        }
    }


    func didTapAddContact() {
        router.shouldPresentCreateContactInterface()
    }

    func didSelectContact(name: String) {
        self.addContactToCurrentSelection(contactToAdd: name)
        didChangeSelection(currentSelection)
        interactor.findContacts(forEvent: nil)
    }

    func didUnselectContact(name: String) {
        self.removeContactToCurrentSelection(contactToRemove: name)
        didChangeSelection(currentSelection)
        interactor.findContacts(forEvent: nil)
    }

    func viewWillAppear() {
        interactor.findContacts(forEvent: nil)
    }
}
