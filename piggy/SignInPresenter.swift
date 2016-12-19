//
//  SignInPresenter.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 19/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

class SignInPresenter {
    var interactor: SignInInteractorInput?
    var userInterface: SignInViewController?
    var delegate: SignInModuleDelegate?
}

extension SignInPresenter: SignInModuleInterface {
    func signInUser(username: String, password: String) {
        interactor?.createNewUser(username: username, password: password)
    }
    
    func cancelSignInAction() {
        delegate?.didCancelSignInAction()
    }
}
