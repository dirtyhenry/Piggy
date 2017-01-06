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

    func viewIsReady() {
        view.setupInitialState()
    }

    internal func didTapCancelCreateExpense() {
        router.shouldDismiss()
    }

    internal func didTapConfirmCreateExpense() {
        // Do nothing
    }
}
