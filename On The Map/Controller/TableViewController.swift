//
//  TableViewController.swift
//  On The Map
//
//  Created by Emil Haroutunian on 4/8/21.
//

import UIKit

class TableViewController: UITableViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return appDelegate.studentInfo.count
       
            }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return appDelegate.studentInfo.count
    }
}

