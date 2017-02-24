//
//  CreateExpenseCreateExpenseModuleInput.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

protocol CreateExpenseModuleInput: class {
    func updatePayers(_ newValue: [String])
    func updateBenefiters(_ newValue: [String])
}
