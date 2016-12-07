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
    
    init(window: UIWindow) {
        tabBarController = window.rootViewController as! UITabBarController
        
        let oneToOneNavigationController = storyboard.instantiateViewController(withIdentifier: "OneToOneListNC") as! UINavigationController
        oneToOneNavigationController.tabBarItem = UITabBarItem(title: "One-to-One",
                                                               image: UIImage.fontAwesomeIcon(name: .add, textColor: UIColor.black, size: CGSize(width: 30, height: 30)),
                                                               tag: 1)
        tabBarController.setViewControllers([oneToOneNavigationController], animated: false)
    }
}
