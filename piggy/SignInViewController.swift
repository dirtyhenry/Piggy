//
//  SignInViewController.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 19/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    var eventHandler: SignInModuleInterface?
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameTextField.becomeFirstResponder()
    }

    @IBAction func didTapCancelButton() {
        eventHandler?.cancelSignInAction()
    }
    
    @IBAction func didTapSaveButton() {
        if let usernameText = usernameTextField.text {
            if let passwordText = passwordTextField.text {
                eventHandler?.signInUser(username: usernameText, password: passwordText)
            }
        }
    }
}
