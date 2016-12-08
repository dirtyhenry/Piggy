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
        
        addContactInteractor.presenter = addContactPresenter
        addContactPresenter.interactor = addContactInteractor
        addContactPresenter.userInterface = addContactVC
        addContactVC.eventHandler = addContactPresenter
    }
    
    
    func heightOfTabBarItem() -> CGFloat {
        return CGFloat(UIScreen.main.scale) * CGFloat(25.0);
    }
    
    func sizeForTabBarItem() -> CGSize {
        let dimension = heightOfTabBarItem()
        return CGSize(width: dimension, height: dimension)
    }
}
