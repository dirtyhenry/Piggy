//
//  OneToOneRoute.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 10/03/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit
import Martinet

class OneToOneRoute {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigationController: UINavigationController

    init() {
        let coreDataStack = CoreDataCoordinator(modelName: "piggy-model")
        let contactDataManager = ContactCoreDataManager(stack: coreDataStack)
        let rootViewController = ListContactTableViewController()

        navigationController = UINavigationController.init(rootViewController: rootViewController)
    }

    var rootViewController: UIViewController {
        get {
            return navigationController
        }
    }

//    func wireContactListComponents() {
//        let contactListVC = oneToOneNC.viewControllers[0] as! ListContactTableViewController
//        self.contactListPresenter = ListContactPresenter()
//        let contactListInteractor = ListContactInteractor()
//
//        let contactDataManager = ContactCoreDataManager(stack: coreDataStack)
//
//        contactListPresenter?.interactor = contactListInteractor
//        contactListPresenter?.userInterface = contactListVC
//        contactListPresenter?.router = self
//        contactListInteractor.presenter = contactListPresenter
//        contactListInteractor.dataManager = contactDataManager
//        contactListVC.eventHandler = contactListPresenter
//    }

}
