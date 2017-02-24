//
//  CreateExpenseCreateExpenseRouterInput.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import Foundation

protocol CreateExpenseRouterInput {
    func shouldDismiss()
    func shouldPresentSelectContactInterface(currentSelection: [String], callback: ([String]) -> ())
}

