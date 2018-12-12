//
//  PetCell.swift
//  CSC690Final
//
//  Created by Kurtis Hoang on 12/11/18.
//  Copyright © 2018 Kurtis Hoang. All rights reserved.
//

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
