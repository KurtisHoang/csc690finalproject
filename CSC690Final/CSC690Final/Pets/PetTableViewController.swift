//
//  PetTableViewController.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/11/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

import UIKit

class PetTableViewController: UITableViewController {
    
    var account: Accounts?
    var pets: [Pets] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //tells us how many rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currPet = pets[indexPath.row]
        
        //create a new cell that is PetCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell") as! PetCell
        
        //add to cell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do segue here
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
