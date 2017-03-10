//
//  AppRoute.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit
import FontAwesome_swift

/// The root level routing object for the application.
/// This component manages the `UITabBarController` at the root level of our window.
class AppRoute {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabBarController: UITabBarController
    let oneToOneRoute: OneToOneRoute

    let coreDataStack = CoreDataCoordinator(modelName: "piggy-model")

    // FIXME: this shouldn't be here
    var contactListPresenter: ListContactPresenter?

    init(window: UIWindow) {
        tabBarController = window.rootViewController as! UITabBarController

        oneToOneRoute = OneToOneRoute()
        let oneToOneTabImage = UIImage.fontAwesomeIcon(name: .users,
                                                       textColor: UIColor.black,
                                                       size: sizeForTabBarItem())
        oneToOneRoute.rootViewController.tabBarItem = UITabBarItem(title: "One-to-One",
                                                                   image: oneToOneTabImage,
                                                                   tag: 1)

        tabBarController.setViewControllers([oneToOneRoute.rootViewController],
                                            animated: false)
    }



    func heightOfTabBarItem() -> CGFloat {
        return CGFloat(25.0);
    }

    func sizeForTabBarItem() -> CGSize {
        let dimension = heightOfTabBarItem()
        return CGSize(width: dimension, height: dimension)
    }
}

extension AppRoute: AddContactModuleDelegate {
    func didCancelAddContactAction() {
        let navigationController = tabBarController.presentedViewController as! UINavigationController
        navigationController.popViewController(animated: true)
    }

    func didSaveAddContactAction(name: String) {
        let navigationController = tabBarController.presentedViewController as! UINavigationController
        navigationController.popViewController(animated: true)

//        if let selectContactVC = selectContactVC {
//            // FIXME: this is gross
//            let presenter = selectContactVC.output as! SelectContactPresenter
//            presenter.addContactToCurrentSelection(contactToAdd: name)
//        }
    }
}

extension AppRoute: ListContactRouterInput {
    func presentCreateExpenseInterface() {
//        let createExpenseNC = storyboard.instantiateViewController(withIdentifier: "CreateExpenseNC") as! UINavigationController
//        createExpenseNC.modalPresentationStyle = .overCurrentContext
//
//        let createExpenseVC = createExpenseNC.viewControllers[0] as! CreateExpenseViewController
//        let configurator = CreateExpenseModuleConfigurator()
//        configurator.configureModuleForViewInput(viewInput: createExpenseVC,
//                                                 dismiss: dismissModalViewController,
//                                                 presentSelectContactInterfaceHandler: presentSelectContact)
//        tabBarController.present(createExpenseNC, animated: true, completion: nil)
    }

    func dismissModalViewController() {
        self.tabBarController.dismiss(animated: true, completion: nil)
    }

//    func presentSelectContact(currentSelection: [String]) -> SelectContactModuleInput? {
//        self.selectContactVC = storyboard.instantiateViewController(withIdentifier: "SelectContactInterface") as? SelectContactViewController
//        if let selectContactVC = selectContactVC {
//            let configurator = SelectContactModuleConfigurator()
//            let result = configurator.configureModuleForViewInput(viewInput: selectContactVC,
//                                                     stack: coreDataStack,
//                                                     presentContactInterfaceHandler: showAddContact)
//            let createExpenseNC = tabBarController.presentedViewController as! UINavigationController
//            createExpenseNC.pushViewController(selectContactVC, animated: true)
//
//            // FIXME: this is gross
//            let presenter = selectContactVC.output as! SelectContactPresenter
//            presenter.updateView()
//
//            return result
//        }
//        return nil
//    }

    func showAddContact() {
        let navigationController = tabBarController.presentedViewController as! UINavigationController
        let addContactVC = storyboard.instantiateViewController(withIdentifier: "AddContactVC") as! AddContactViewController
        let addContactPresenter = AddContactPresenter()
        let addContactInteractor = AddContactInteractor()
        let contactDataManager = ContactCoreDataManager(stack: coreDataStack)

        addContactInteractor.presenter = addContactPresenter
        addContactInteractor.addContactManager = contactDataManager
        addContactPresenter.interactor = addContactInteractor
        addContactPresenter.userInterface = addContactVC
        addContactPresenter.delegate = self
        addContactVC.eventHandler = addContactPresenter

        navigationController.pushViewController(addContactVC, animated: true)
    }
}
