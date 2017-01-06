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
    // FIXME: move to a One-To-One dedicated route
    let oneToOneNC: UINavigationController
    let coreDataStack = CoreDataCoordinator(modelName: "piggy-model")

    // FIXME: this shouldn't be here
    var contactListPresenter: ListContactPresenter?

    init(window: UIWindow) {
        tabBarController = window.rootViewController as! UITabBarController
        
        oneToOneNC = storyboard.instantiateViewController(withIdentifier: "OneToOneNC") as! UINavigationController
        wireContactListComponents()
        
        let oneToOneTabImage = UIImage.fontAwesomeIcon(name: .users, textColor: UIColor.black, size: sizeForTabBarItem())
        oneToOneNC.tabBarItem = UITabBarItem(title: "One-to-One",
                                             image: oneToOneTabImage,
                                             tag: 1)
        
        tabBarController.setViewControllers([oneToOneNC], animated: false)
    }
    
    
    func wireContactListComponents() {
        let contactListVC = oneToOneNC.viewControllers[0] as! ListContactTableViewController
        self.contactListPresenter = ListContactPresenter()
        let contactListInteractor = ListContactInteractor()

        let contactDataManager = ContactCoreDataManager(stack: coreDataStack)
        
        contactListPresenter?.interactor = contactListInteractor
        contactListPresenter?.userInterface = contactListVC
        contactListPresenter?.router = self
        contactListInteractor.presenter = contactListPresenter
        contactListInteractor.dataManager = contactDataManager
        contactListVC.eventHandler = contactListPresenter
    }
    
    func showAddContact() {
        let addContactNC = storyboard.instantiateViewController(withIdentifier: "AddContactNC") as! UINavigationController
        let addContactVC = addContactNC.viewControllers[0] as! AddContactViewController
        let addContactPresenter = AddContactPresenter()
        let addContactInteractor = AddContactInteractor()
        let contactDataManager = ContactCoreDataManager(stack: coreDataStack)

        addContactInteractor.presenter = addContactPresenter
        addContactInteractor.addContactManager = contactDataManager
        addContactPresenter.interactor = addContactInteractor
        addContactPresenter.userInterface = addContactVC
        addContactPresenter.delegate = self
        addContactVC.eventHandler = addContactPresenter
        
        addContactNC.modalPresentationStyle = .overCurrentContext
        tabBarController.present(addContactNC, animated: true, completion: nil)
    }
    
    
    func heightOfTabBarItem() -> CGFloat {
        return CGFloat(UIScreen.main.scale) * CGFloat(25.0);
    }
    
    func sizeForTabBarItem() -> CGSize {
        let dimension = heightOfTabBarItem()
        return CGSize(width: dimension, height: dimension)
    }
}

extension AppRoute: AddContactModuleDelegate {
    func didCancelAddContactAction() {
        tabBarController.dismiss(animated: true, completion: nil)
    }

    func didSaveAddContactAction() {
        tabBarController.dismiss(animated: true, completion: nil)
        contactListPresenter?.updateView(referenceContactName: nil)
    }
}

extension AppRoute: ListContactRouterInput {
    func presentCreateExpenseInterface() {
        let createExpenseVC = storyboard.instantiateViewController(withIdentifier: "CreateExpenseVC") as! CreateExpenseViewController
        oneToOneNC.pushViewController(createExpenseVC, animated: true)
    }
}
