//
//  ListContactTableViewController.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 07/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit
import Martinet

class ListContactTableViewController: ItemsTableViewController<Contact, ContactBalanceTableViewCell> {
    init() {
        super.init(items: []) { cell, contact in
            cell.leftLabel.text = "TOTO"
            cell.rightLabel.text = "4"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
