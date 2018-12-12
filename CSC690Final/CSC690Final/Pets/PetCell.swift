//
//  PetCell.swift
//  CSC690Final


import UIKit

class PetCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    func setIcon()
    {
        icon.image = UIImage(named: breedLabel.text!)
    }
}
