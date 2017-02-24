//
//  SelectContactSelectContactModuleInput.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

protocol SelectContactModuleInput: class {
    var didChangeSelection: ([String]) -> () { get set }

    func setCurrentSelection(currentSelection: [String])
    func addContactToCurrentSelection(contactToAdd: String)

    func updateView()
}
