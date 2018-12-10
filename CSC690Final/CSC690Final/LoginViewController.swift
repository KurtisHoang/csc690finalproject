//
//  ViewController.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/9/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //stores the text from the username textfield
    @IBOutlet weak var usernameField: UITextField!
    //stores the text from the password textfield
    @IBOutlet weak var passwordField: UITextField!
    
    //test accounts
    var accounts: [Accounts] = [Accounts(newUsername: "loktd", newPassword: "hahaokay"), Accounts(newUsername: "Athena", newPassword: "hahaokay"), Accounts(newUsername: "amalunao", newPassword: "hahaokay")]
    
    var currAccount: Accounts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    /*
     stuff added to storyboard
     ----------------------------------
     added a segue to the profile view
     segue is called loginSegue
     added a segue to the create account view
     segue is called signupSegue
     */
    
    //when log in button is pressed
    @IBAction func LoginButtonPressed(_ sender: Any) {
        //if accounts is not empty
        if(accounts.count != 0){
            //for loop to check all the accounts that have been created
            for i in 0..<accounts.count {
                //check account name to be the same
                if(accounts[i].username == usernameField.text && accounts[i].password == passwordField.text)
                {
                    currAccount = Accounts(newUsername: accounts[i].username, newPassword: accounts[i].password)
                    //move to profile view through segue
                    performSegue(withIdentifier: "loginSegue", sender: self)
                }
            }
        }
    }
    
    //when sign up button is pressed
    @IBAction func SignupButtonPressed(_ sender: Any) {
        
    }
    
    //send stuff to other views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loginSegue")
        {
            //pass currAccount to profile view
        }
    }
    
}
