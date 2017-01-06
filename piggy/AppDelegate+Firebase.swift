//
//  AppDelegate+Firebase.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 08/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit
import Firebase

/// This class isolates all delegate-level calls depending on the Firebase pods.
/// For more information about them, please refer to Firebase's iOS SDK online documentation.
class AppDelegateFirebase {
    /// Configure Firebase. Required by Firebase.
    func configure() {
        FIRApp.configure()
    }
}
