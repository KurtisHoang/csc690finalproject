//
//  SignupViewController.swift
//  CSC690Final


import UIKit

class SignupViewController: UIViewController {
    
    //variables
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var accounts: [Accounts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //when create account button is presseds
    @IBAction func CreateAccountButtonPressed(_ sender: Any) {
        for i in 0..<accounts.count {
            if(usernameField.text == accounts[i].username)
            {
                //creating an alert box
                let alert = UIAlertController(title: "Error", message: "That username is already taken!", preferredStyle: .alert)
                
                let okayButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                
                alert.addAction(okayButton)
                self.present(alert, animated: true, completion:  nil)
            }
        }
        
        //if username textField is empty
        if(usernameField.text == "")
        {
            //creating an alert box
            let alert = UIAlertController(title: "Error", message: "Please input a username!", preferredStyle: .alert)
            
            let okayButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            
            alert.addAction(okayButton)
            self.present(alert, animated: true, completion:  nil)
        }
        
        //if password textField is empty
        if(passwordField.text == "")
        {
            //creating an alert box
            let alert = UIAlertController(title: "Error", message: "Please input a password!", preferredStyle: .alert)
            
            let okayButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            
            alert.addAction(okayButton)
            self.present(alert, animated: true, completion:  nil)
        }
        
        //if password is too short //minimum 5 characters
        if(passwordField.text!.count < 5)
        {
            //creating an alert box
            let alert = UIAlertController(title: "Error", message: "Password is too short! Please input a password that is has at least 5 characters.", preferredStyle: .alert)
            
            let okayButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            
            alert.addAction(okayButton)
            self.present(alert, animated: true, completion:  nil)
        }
        
        //save username and password here using UserDefaults
        
        //move to profile view through segue
        performSegue(withIdentifier: "createdSegue", sender: self)
    }
    
    //send stuff to other views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "createdSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? profileViewController {
                destination.account = Accounts(newUsername: usernameField.text!, newPassword: passwordField.text!)
            }
        }
    }
    
}
