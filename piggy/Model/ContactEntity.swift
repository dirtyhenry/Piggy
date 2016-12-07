//
//  Contact.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 05/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

struct ContactEntity {
    let name: String
    let isRoot: Bool
}

struct ContactBalanceDeliverer {
    let name: String
    let balance: Double
}

struct ContactBalanceViewModel {
    let name: String
    let balance: String
    let balanceColor: UIColor
}
