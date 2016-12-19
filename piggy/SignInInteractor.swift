//
//  SignInInteractor.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 19/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import Foundation

class SignInInteractor {
    var presenter: SignInPresenter?
    var authenticator: SignInDataManager?
}

extension SignInInteractor: SignInInteractorInput {
    func createNewUser(username: String, password: String) {
        authenticator?.createNewUser(username: username, password: password)
    }
}
