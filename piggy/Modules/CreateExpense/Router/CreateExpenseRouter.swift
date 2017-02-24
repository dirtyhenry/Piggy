//
//  CreateExpenseCreateExpenseRouter.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

// FIXME: I don't really like this part. 
// Make sure how the generator objects are supposed to be used!
class CreateExpenseRouter: CreateExpenseRouterInput {
    var dismissHandler: () -> () = { }
    var presentSelectContactInterfaceHandler: ([String]) -> () = { _ in }

    func shouldDismiss() {
        dismissHandler()
    }

    func shouldPresentSelectContactInterface(currentSelection: [String],
                                             callback: ([String]) -> ()) {
        presentSelectContactInterfaceHandler(currentSelection)

    }
}
