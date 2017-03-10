//
//  ContactBalanceTableViewCell.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 10/03/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

class ContactBalanceTableViewCell: UITableViewCell {
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
