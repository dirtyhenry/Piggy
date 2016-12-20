//
//  ListContactModuleInterface.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

/// VIPER interface for the **List Contact** whole module.
protocol ListContactModuleInterface {

    /// Add new contact
    func addNewContact()

    /// Update the view.
    ///
    /// - Parameter referenceContactName: the reference contact name or `nil` to use the root contact
    func updateView(referenceContactName: String?)
}


/// VIPER interface for the **List Contact** interactor input.
protocol ListContactInteractorInput {

    /// Find contacts of a contact
    ///
    /// - Parameter name: the reference contact name or `nil` to use the root contact
    func findContacts(of name: String?)
}


/// VIPER interface for the **List Contact** interactor output.
protocol ListContactInteractorOutput {

    /// Found contacts of a contact
    ///
    /// - Parameters:
    ///   - name: the reference contact name or `nil` to use the root contact
    ///   - contacts: the array of contacts to display
    func foundContacts(of name: String?, contacts: [ContactBalanceDeliverer])
}


/// VIPER interface for the **List Contact** view interface.
protocol ListContactViewInterface {

    /// Show a message to the user to explain no content was found.
    ///
    /// - Parameter title: the title of the alert
    func showNoContentMessage(title: String)

    /// Show a table of contacts with a title header.
    ///
    /// - Parameters:
    ///   - contacts: sorted array of contacts to show
    ///   - title: the title of the table
    func showContacts(contacts: [ContactBalanceViewModel], title: String)
}


/// VIPER interface for the **List Contact** data manager.
protocol ListContactDataManager {

    /// Fetch contents from the data store, excluding the one with the name in parameter.
    ///
    /// - Parameter except: name to exclude from the fetch request
    /// - Returns: an array of Contact elements
    func fetchAllContacts(except: String?) -> [Contact]
}
