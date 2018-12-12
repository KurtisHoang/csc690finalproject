//
//  ViewController.swift
//  CSC690Final


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
        
        //load UserDefaults here to get all saved info
        
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
        //find match
        var noMatch: Bool = false
        //if accounts is not empty
        if(accounts.count != 0){
            //for loop to check all the accounts that have been created
            for i in 0..<accounts.count {
                //check account name to be the same
                if(accounts[i].username == usernameField.text && accounts[i].password == passwordField.text)
                {
                    //set currAccount to be the main account
                    currAccount = Accounts(newUsername: accounts[i].username, newPassword: accounts[i].password)
                    //move to profile view through segue
                    performSegue(withIdentifier: "loginSegue", sender: self)
                }
                //no matches
                noMatch = true
            }
            
            if noMatch == true
            {
                //creating an alert box
                let alert = UIAlertController(title: "Error", message: "There is no matching username or password.", preferredStyle: .alert)
                
                //okay button
                let okayButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                
                //add the okay button to alert
                alert.addAction(okayButton)
                self.present(alert, animated: true, completion:  nil)
            }
        }
        else
        {
            //creating an alert box
            let alert = UIAlertController(title: "Error", message: "There are no accounts in the System", preferredStyle: .alert)
            
            //okay button
            let okayButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            
            //add the okay button to alert
            alert.addAction(okayButton)
            self.present(alert, animated: true, completion:  nil)
        }
    }
    
    //when sign up button is pressed
    @IBAction func SignupButtonPressed(_ sender: Any) {
        //move to sign up view through segue
        performSegue(withIdentifier: "signupSegue", sender: self)
    }
    
    //send stuff to other views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loginSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? profileViewController {
                destination.account = currAccount
            }
        }
        
        if(segue.identifier == "signupSegue")
        {
            //pass data from accounts to Signup view
            if let destination = segue.destination as? SignupViewController {
                destination.accounts = accounts
            }
        }
    }
    
}
