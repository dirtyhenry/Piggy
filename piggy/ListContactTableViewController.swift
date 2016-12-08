//
//  ListContactTableViewController.swift
//  piggy
//
//  Created by Mickaël Floc'hlay on 07/12/2016.
//  Copyright © 2016 Bootstragram. All rights reserved.
//

import UIKit

class ListContactTableViewController: UITableViewController {
    var eventHandler: ListContactModuleInterface?
    var arraySource: [ContactBalanceViewModel]?
    var didTapAddContact: () -> () = {}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - View Controller life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler?.updateView(referenceContactName: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let arraySource = arraySource {
            return arraySource.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)

        if let arraySource = arraySource {
            cell.textLabel?.text = arraySource[indexPath.row].name
            cell.detailTextLabel?.text = arraySource[indexPath.row].balance
            cell.detailTextLabel?.textColor = arraySource[indexPath.row].balanceColor
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListContactTableViewController: ListContactViewInterface {
    func showNoContentMessage(title: String) {
        navigationItem.title = title
        arraySource = []
        tableView.reloadData()
    }

    func showContacts(contacts: [ContactBalanceViewModel], title: String) {
        navigationItem.title = title
        arraySource = contacts
        tableView.reloadData()
    }
    
    @IBAction func addNewContact() {
        didTapAddContact()
    }
}
