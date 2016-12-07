//
//  ContactListModuleInterface.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

protocol ContactListModuleInterface {
    func addNewContact()
    func changeReferenceContact(name: String)
    func updateView()
}
