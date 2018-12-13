//
//  MessageCell.swift
//  CSC690Final

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var rightLabel: UILabel!
    
    var side: Int?
    
    var currMessage: String? {
        didSet {
            if let message = currMessage {
                leftView.isHidden = true
                rightView.isHidden = true
                if side == 0 {
                    leftView.isHidden = false
                    leftLabel.text = message
                    leftView.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
                    leftView.layer.cornerRadius = 10
                    leftView.clipsToBounds = true
                }
                else {
                    rightView.isHidden = false
                    rightLabel.text = message
                    rightView.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.5, blue: 1, alpha: 1)
                    rightView.layer.cornerRadius = 10
                    rightView.clipsToBounds = true
                }
            }
        }
    }
}
