//
//  AuthenticationRoute.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 19/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class AuthenticationRoute {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let authenticationNC: UINavigationController

    init() {
        authenticationNC = storyboard.instantiateViewController(withIdentifier: "AuthenticationNC") as! UINavigationController
        showSignInForm()
    }
    
    func showSignInForm() {
        let viewController = authenticationNC.viewControllers[0] as! SignInViewController
        let presenter = SignInPresenter()
        let interactor = SignInInteractor()
        let dataManager = AuthenticationFirebaseManager()
        
        interactor.presenter = presenter
        interactor.authenticator = dataManager
        presenter.interactor = interactor
        presenter.userInterface = viewController
        presenter.delegate = self
        viewController.eventHandler = presenter
    }
}

extension AuthenticationRoute: SignInModuleDelegate {
    func didCancelSignInAction() {
        //...
    }

    func didSignInAction() {
        
    }
}
