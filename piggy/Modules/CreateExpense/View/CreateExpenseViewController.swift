//
//  CreateExpenseCreateExpenseViewController.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import UIKit

class CreateExpenseViewController: UITableViewController, CreateExpenseViewInput {

    var output: CreateExpenseViewOutput!

    let selectedPayers: [String] = []
    let selectedBenefiters: [String] = []

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()


    }


    // MARK: CreateExpenseViewInput
    func setupInitialState() {
        self.navigationItem.title = "New Expense"

        self.tableView.dataSource = self
    }

    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            return self.cellForContactSection(tableView, array: selectedPayers, index: indexPath.row)
        case 2:
            return self.cellForContactSection(tableView, array: selectedBenefiters, index: indexPath.row)
        default:
            return self.cellForAmountAndDescriptionSection(tableView, row: indexPath.row)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return max(selectedPayers.count, 1)
        case 2:
            return max(selectedBenefiters.count, 1)
        default:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Payers"
        case 2:
            return "Benefiters"
        default:
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func cellForAmountAndDescriptionSection(_ tableView: UITableView, row: Int) -> UITableViewCell {
        let res = tableView.dequeueReusableCell(withIdentifier: "AmountAndDescriptionSection") as! TextFieldTableViewCell
        if let textField = res.textField {
            textField.text = nil
            textField.placeholder = row == 0 ? "Amount" : "Description"
        }
        return res
    }

    func cellForContactSection(_ tableView: UITableView, array: [String], index: Int) -> UITableViewCell {
        let res = tableView.dequeueReusableCell(withIdentifier: "ContactSection")!
        if array.count == 0 {
            res.textLabel?.text = "Tap to add one"
        } else {
            res.textLabel?.text = array[index]
        }
        return res
    }

    @IBAction func cancelAction(sender: AnyObject?) {
        output.didTapCancelCreateExpense()
    }

    @IBAction func confirmAction(sender: AnyObject?) {
        output.didTapConfirmCreateExpense()
    }
}
