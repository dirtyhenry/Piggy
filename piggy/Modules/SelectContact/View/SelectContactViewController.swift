//
//  SelectContactSelectContactViewController.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

class SelectContactViewController: ArrayTableViewController, SelectContactViewInput {
    var output: SelectContactViewOutput!

    @IBAction func didTapAddAction() {
        output.didTapAddContact()
    }

    func updateContactList(contacts: [SelectContactViewModel]) {
        configure(dataItems: contacts,
                  cellIdentifier: "selectContactCell") { (cell, item) in
                    let contact: SelectContactViewModel = item as! SelectContactViewModel
                    cell.textLabel?.text = contact.name
                    cell.accessoryType = contact.selected ? .checkmark : .none
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact: SelectContactViewModel = dataItemAt(indexPath: indexPath) as! SelectContactViewModel
        if selectedContact.selected {
            output.didUnselectContact(name: selectedContact.name)
        } else {
            output.didSelectContact(name: selectedContact.name)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
