//
//  AddContactViewController.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 08/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    var eventHandler: AddContactModuleInterface?
    
    @IBOutlet var contactNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Actions
    
    @IBAction func didTapCancelButton() {
        eventHandler?.cancelAddContactAction()
    }
    
    @IBAction func didTapSaveButton() {
        if let contactNameText = contactNameTextField.text {
            eventHandler?.saveAddContactAction(name: contactNameText)
        }
    }
}


extension AddContactViewController: AddContactViewInterface {
    func showErrorMessage(errorTitle: String, errorMessage: String?) {
        let alertController = UIAlertController(title: errorTitle,
                                                message: errorMessage,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
    }
}
