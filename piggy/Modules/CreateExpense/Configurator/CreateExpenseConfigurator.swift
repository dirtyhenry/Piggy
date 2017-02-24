//
//  CreateExpenseCreateExpenseConfigurator.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

class CreateExpenseModuleConfigurator {
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController,
                                     dismiss: @escaping () -> (),
                                     presentSelectContactInterfaceHandler: @escaping ([String]) -> (SelectContactModuleInput)) {
        if let viewController = viewInput as? CreateExpenseViewController {
            configure(viewController: viewController,
                      dismiss: dismiss,
                      presentSelectContactInterfaceHandler: presentSelectContactInterfaceHandler)
        }
    }

    private func configure(viewController: CreateExpenseViewController,
                           dismiss: @escaping () -> (),
                           presentSelectContactInterfaceHandler: @escaping ([String]) -> (SelectContactModuleInput)) {
        let router = CreateExpenseRouter()
        router.dismissHandler = dismiss
        //router.presentSelectContactInterfaceHandler = presentSelectContactInterfaceHandler

        let presenter = CreateExpensePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreateExpenseInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
