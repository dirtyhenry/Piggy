//
//  CreateExpenseCreateExpenseViewOutput.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

protocol CreateExpenseViewOutput {

    /**
        @author Bootstragram
        Notify presenter that view is ready
    */

    func viewIsReady()


    func didTapCancelCreateExpense()
    func didTapConfirmCreateExpense()

    func didTapSelectContactForSection(section: Int, currentSelection: [String])
}
