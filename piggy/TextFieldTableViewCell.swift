//
//  TextFieldTableViewCell.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    @IBOutlet var textField: UITextField?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
