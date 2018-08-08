//
//  MessageThreadsTableViewController.swift
//  ios-message-board
//
//  Created by Lambda-School-Loaner-11 on 8/8/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class MessageThreadsTableViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
