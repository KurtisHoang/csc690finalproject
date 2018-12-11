//
//  profileViewController.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/9/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

import UIKit

//need UINavigationControllerDelegate and UIImagePickerControllerDelegate for imagePicker and imagePickerController function
class profileViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //variables
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var account: Accounts?
    //for picking an image from the photo library
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set label to username
        usernameLabel.text = account?.username
        
        //descriptionLabel numberOfRow is 0 shown in the attribute inspector
        //add text to descriptionLabel
        descriptionLabel.text = descriptionLabel.text! + "This is the default description for your account. You can change this description by pressing the edit button."
        //fit the descriptionLabel's size
        descriptionLabel.sizeToFit()
    }
    
    //when button is pressed
    @IBAction func imageButtonPressed(_ sender: Any) {
        //allow access to photo library
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    //choose an image from photo library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            //set imageView's image to the chosen image
            imageView.image = image
        }
        //dismiss the photo library after chosen an image
        dismiss(animated: true, completion: nil)
    }
    
    //when edit button is pressed
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    //when view pets button is pressed
    @IBAction func viewpetsButtonPressed(_ sender: Any) {
        
    }
}
