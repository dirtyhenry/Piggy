//
//  CreateExpenseCreateExpensePresenter.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

class CreateExpensePresenter: CreateExpenseModuleInput, CreateExpenseViewOutput, CreateExpenseInteractorOutput {

    weak var view: CreateExpenseViewInput!
    var interactor: CreateExpenseInteractorInput!
    var router: CreateExpenseRouterInput!

    var payers: [String] = []
    var benefiters: [String] = []

    func viewIsReady() {
        view.setupInitialState()
    }

    internal func didTapCancelCreateExpense() {
        router.shouldDismiss()
    }

    internal func didTapConfirmCreateExpense() {
        // Do nothing
    }

    internal func didTapSelectContactForSection(section: Int, currentSelection: [String]) {
        router.shouldPresentSelectContactInterface(currentSelection: currentSelection) { newContactSelection in
            // TODO: this is shit, use an enum or something
            if section == 1 {
                updatePayers(newContactSelection)
            }

            if section == 2 {
                updatePayers(newContactSelection)
            }
        }
    }

    func updatePayers(_ newValue: [String]) {
        payers = newValue
    }

    func updateBenefiters(_ newValue: [String]) {
        benefiters = newValue
    }
}
