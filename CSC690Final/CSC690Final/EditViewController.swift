//
//  EditViewController.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/10/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    var account: Accounts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //rounds the descriptionField
        descriptionField.layer.cornerRadius = 10.0
        //same border color as textfields
        let borderColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        //set border color and border width
        descriptionField.layer.borderColor = borderColor.cgColor
        descriptionField.layer.borderWidth = 1.0
        //add text and change the text color
        descriptionField.text = "Add your profile description here."
        descriptionField.textColor = UIColor.lightGray
        //allow UITextViewDelegate
        descriptionField.delegate = self
        
    }
    
    //when starting to write in textView
    func textViewDidBeginEditing(_ textView: UITextView) {
        //if text == placeholder text, empty the textView and change color
        if(descriptionField.text == "Add your profile description here.")
        {
            descriptionField.text = ""
            descriptionField.textColor = UIColor.black
        }
    }
    
    //when finishing textView
    func textViewDidEndEditing(_ textView: UITextView) {
        //if empty put placeholder description and change color
        if(descriptionField.text == "")
        {
            descriptionField.text = "Add your profile description here."
            descriptionField.textColor = UIColor.lightGray
        }
    }
    
    //when cancel button has been pressed
    @IBAction func cancelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "cancelSegue", sender: self)
    }
    
    //when apply button has been pressed
    @IBAction func applyButtonPressed(_ sender: Any) {
        //set name and description
        account?.addName(newName: nameField.text!)
        var currDescription = descriptionField.text
        if(currDescription == "Add your profile description here.")
        {
            currDescription = "This is the default description for your account. You can change this description by pressing the edit button."
        }
        account?.addDescription(newDescription: currDescription!)
        performSegue(withIdentifier: "applySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //cancel segue
        if(segue.identifier == "cancelSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? profileViewController {
                destination.account = account
            }
        }
        
        //apply segue
        if(segue.identifier == "applySegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? profileViewController {
                destination.account = account
            }
        }
    }
}
