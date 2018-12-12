//
//  PetProfileViewController.swift
//  CSC690Final


import UIKit

class PetProfileViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var account: Accounts?
    var animal: Pets?
    var messageList: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize everything
        animalLabel.text = animal?.animal
        breedLabel.text = animal?.breed
        
        //check if dog or cat the set up a generic description
        if(animalLabel.text == "Dog")
        {
            descriptionLabel.text = descriptionLabel.text! + "I am an energetic dog! I love to play fetch and go outside!"
        }
        else
        {
            descriptionLabel.text = descriptionLabel.text! + "I am a cat. I love to play with my cat toys. I also like to fit in small areas."
        }
        
        //fit the descriptionLabel's size
        descriptionLabel.sizeToFit()
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backpetprofileSegue", sender: self)
    }
    
    //when the message button is pressed
    @IBAction func messageButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "chatSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "backpetprofileSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? PetTableViewController
            {
                destination.account = account
            }
        }
        if(segue.identifier == "chatSegue")
        {
            //pass data from currAccount to profile view
            if let destination = segue.destination as? MessageViewController
            {
                destination.account = account
                destination.messageList = messageList
            }
        }
    }
}
