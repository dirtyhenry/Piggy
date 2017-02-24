//
//  SelectContactSelectContactConfigurator.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

enum SelectContactModuleConfiguratorError: Error {
    case invalidViewController
}

class SelectContactModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController,
                                     stack: CoreDataCoordinator?,
                                     presentContactInterfaceHandler: @escaping () -> ()) throws -> SelectContactModuleInput {
        if let viewController = viewInput as? SelectContactViewController {
            return configure(viewController: viewController,
                      stack: stack,
                      presentContactInterfaceHandler: presentContactInterfaceHandler)
        } else {
            throw SelectContactModuleConfiguratorError.invalidViewController
        }
    }

    private func configure(viewController: SelectContactViewController,
                           stack: CoreDataCoordinator?,
                           presentContactInterfaceHandler: @escaping () -> ()) -> SelectContactModuleInput {
        let router = SelectContactRouter()
        router.presentContactInterfaceHandler = presentContactInterfaceHandler

        let presenter = SelectContactPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SelectContactInteractor()
        interactor.output = presenter
        if let stack = stack {
            interactor.dataManager = ContactCoreDataManager(stack: stack)
        }

        presenter.interactor = interactor
        viewController.output = presenter

        return presenter
    }
    
}
