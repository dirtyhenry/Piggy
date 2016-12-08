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
    let oneToOneVC: UINavigationController
    
    
    init(window: UIWindow) {
        tabBarController = window.rootViewController as! UITabBarController
        
        oneToOneVC = storyboard.instantiateViewController(withIdentifier: "OneToOneListNC") as! UINavigationController
        wireContactListComponents()
        
        let oneToOneTabImage = UIImage.fontAwesomeIcon(name: .users, textColor: UIColor.black, size: sizeForTabBarItem())
        oneToOneVC.tabBarItem = UITabBarItem(title: "One-to-One",
                                             image: oneToOneTabImage,
                                             tag: 1)
        
        tabBarController.setViewControllers([oneToOneVC], animated: false)
    }
    
    
    func wireContactListComponents() {
        let contactListVC = oneToOneVC.viewControllers[0] as! ContactListTableViewController
        let contactListPresenter = ContactListPresenter()
        let contactListInteractor = ContactListInteractor()
        
        contactListPresenter.interactor = contactListInteractor
        contactListPresenter.userInterface = contactListVC
        contactListInteractor.presenter = contactListPresenter
        contactListVC.eventHandler = contactListPresenter
    }
    
    
    func heightOfTabBarItem() -> CGFloat {
        return CGFloat(UIScreen.main.scale) * CGFloat(25.0);
    }
    
    func sizeForTabBarItem() -> CGSize {
        let dimension = heightOfTabBarItem()
        return CGSize(width: dimension, height: dimension)
    }
}
