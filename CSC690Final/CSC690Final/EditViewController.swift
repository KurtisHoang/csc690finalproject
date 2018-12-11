//
//  EditViewController.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/10/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //rounds the descriptionField
        descriptionField.layer.cornerRadius = 10.0
        //same border color as textfields
        let borderColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        //set border color and border width
        descriptionField.layer.borderColor = borderColor.cgColor
        descriptionField.layer.borderWidth = 1.0
    }
    
    @IBAction func cencelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "cancelSegue", sender: self)
    }
    
    @IBAction func applyButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "applySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
