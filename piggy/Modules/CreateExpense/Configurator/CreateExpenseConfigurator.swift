//
//  CreateExpenseCreateExpenseConfigurator.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

class CreateExpenseModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CreateExpenseViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CreateExpenseViewController) {

        let router = CreateExpenseRouter()

        let presenter = CreateExpensePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreateExpenseInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
