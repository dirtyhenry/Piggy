//
//  SelectContactSelectContactInteractorOutput.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import Foundation

protocol SelectContactInteractorOutput: class {
    func foundContacts(contacts: [SelectContactPresenterModel])
}
