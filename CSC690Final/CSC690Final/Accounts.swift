//
//  Accounts.swift
//  CSC690Final


import UIKit

//OOP
class Accounts {
    var username: String
    var password: String
    var name: String
    var description: String
    var image: UIImage?
    
    init(newUsername: String, newPassword: String)
    {
        username = newUsername
        password = newPassword
        name = ""
        description = "This is the default description for your account. You can change this description by pressing the edit button."
    }
    
    func addName(newName: String)
    {
        name = newName
    }
    
    func addDescription(newDescription: String)
    {
        description = newDescription
    }
    
    func addImage(newImage: UIImage)
    {
        image = newImage
    }
    
}
