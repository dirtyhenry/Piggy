//
//  ContactCoreDataManager.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 20/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import CoreData

class ContactCoreDataManager {
    let stack: CoreDataCoordinator

    init(stack: CoreDataCoordinator) {
        self.stack = stack
    }
}

extension ContactCoreDataManager: ListContactDataManager {
    func fetchAllContacts(except: String?) -> [Contact] {
        let fetchRequest = NSFetchRequest<Contact>(entityName: "Contact")
        if let exceptName = except {
            fetchRequest.predicate = NSPredicate(format: "name != %@", exceptName)
        }

        do {
            let fetchedContacts = try stack.persistentContainer.viewContext.fetch(fetchRequest)
            return fetchedContacts
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        return []
    }

    internal func fetchAllContacts() -> [Contact] {
        return fetchAllContacts(except: nil)
    }

    internal func fetchContactsForEvent(event: String) -> [Contact] {
        // FIXME: do something about this
        return fetchAllContacts()
    }
}

extension ContactCoreDataManager: AddContactDataManager {
    func addNewContact(_ contact: ContactEntity, completion: (Bool, NSError?) -> ()) {
        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: stack.persistentContainer.viewContext) as! Contact
        newContact.name = contact.name
        newContact.me = contact.isRoot
        stack.saveContext()
        completion(true, nil)
    }
}
