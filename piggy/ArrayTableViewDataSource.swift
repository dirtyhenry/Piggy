//
//  ArrayTableViewDataSource.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 27/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit


/// The `ArrayTableViewDataSource` is a simple data source using an Array.
///
/// It has to subclass from `NSObject` to benefit from its implementation of the 
/// `NSObjectProtocol`, required for a `UITableViewDataSource`.
class ArrayTableViewController: UITableViewController {
    var cellIdentifier: String
    var dataItems: [Any]
    var updateContent: (UITableViewCell, Any) -> ()

    required init?(coder aDecoder: NSCoder) {
        self.cellIdentifier = "default"
        self.dataItems = []
        self.updateContent = { (cell, dataItem) -> () in return }
        super.init(coder: aDecoder)
    }

    func configure(dataItems: [Any], cellIdentifier: String, updateContent: @escaping (UITableViewCell, Any) -> ()) {
        self.dataItems = dataItems
        self.cellIdentifier = cellIdentifier
        self.updateContent = updateContent
    }

    func dataItemAt(indexPath: IndexPath) -> Any {
        return dataItems[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let dataItem = dataItemAt(indexPath: indexPath)
        updateContent(cell, dataItem)
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
}
