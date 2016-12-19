//
//  AppRoute.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit
import FontAwesome_swift

class AppRoute {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabBarController: UITabBarController
    let oneToOneNC: UINavigationController
    let authenticationRoute: AuthenticationRoute
    
    
    init(window: UIWindow) {
        tabBarController = window.rootViewController as! UITabBarController
        
        oneToOneNC = storyboard.instantiateViewController(withIdentifier: "OneToOneNC") as! UINavigationController
        authenticationRoute = AuthenticationRoute()

        wireContactListComponents()
        
        let oneToOneTabImage = UIImage.fontAwesomeIcon(name: .users, textColor: UIColor.black, size: sizeForTabBarItem())
        oneToOneNC.tabBarItem = UITabBarItem(title: "One-to-One",
                                             image: oneToOneTabImage,
                                             tag: 1)
        
        let authenticationNC = authenticationRoute.authenticationNC
        let authenticationTabImage = UIImage.fontAwesomeIcon(name: .user, textColor: .black, size: sizeForTabBarItem())
        authenticationNC.tabBarItem = UITabBarItem(title: "Profile",
                                                   image: authenticationTabImage,
                                                   tag: 2)
        
        tabBarController.setViewControllers([oneToOneNC, authenticationNC], animated: false)
    }
    
    
    func wireContactListComponents() {
        let contactListVC = oneToOneNC.viewControllers[0] as! ListContactTableViewController
        let contactListPresenter = ListContactPresenter()
        let contactListInteractor = ListContactInteractor()
        
        contactListPresenter.interactor = contactListInteractor
        contactListPresenter.userInterface = contactListVC
        contactListInteractor.presenter = contactListPresenter
        contactListVC.eventHandler = contactListPresenter
        contactListVC.didTapAddContact = showAddContact
    }
    
    func showAddContact() {
        let addContactNC = storyboard.instantiateViewController(withIdentifier: "AddContactNC") as! UINavigationController
        let addContactVC = addContactNC.viewControllers[0] as! AddContactViewController
        let addContactPresenter = AddContactPresenter()
        let addContactInteractor = AddContactInteractor()
        let addContactDataManager = ContactFirebaseManager()
        
        addContactInteractor.presenter = addContactPresenter
        addContactInteractor.addContactManager = addContactDataManager
        addContactPresenter.interactor = addContactInteractor
        addContactPresenter.userInterface = addContactVC
        addContactPresenter.delegate = self
        addContactVC.eventHandler = addContactPresenter
        
        addContactNC.modalPresentationStyle = .overCurrentContext
        tabBarController.present(addContactNC, animated: true, completion: nil)
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
        tabBarController.dismiss(animated: true, completion: nil)
    }

    func didSaveAddContactAction() {
        tabBarController.dismiss(animated: true, completion: nil)
    }
}
