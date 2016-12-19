//
//  SignInModuleInterface.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 19/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

protocol SignInModuleInterface {
    func signInUser(username: String, password: String)
    func cancelSignInAction()
}

protocol SignInModuleDelegate {
    func didCancelSignInAction()
    func didSignInAction()
}

protocol SignInInteractorInput {
    func createNewUser(username: String, password: String)
}

protocol SignInInteractorOutput {
    func createdNewUser(username: String)
    func failedCreatingNewUser(username: String)
}

protocol SignInViewInterface {
    func showSignInForm()
}

protocol SignInDataManager {
    func createNewUser(username: String, password: String)
}
