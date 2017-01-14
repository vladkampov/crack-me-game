//
//  ResultTableViewCell.swift
//  crackMe
//
//  Created by Vlad Kampov on 1/14/17.
//  Copyright © 2017 Vlad Kampov. All rights reserved.
//

import UIKit
import FontAwesome

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    @IBOutlet weak var labelFourth: UILabel!
    
    @IBOutlet weak var rightIcon: UILabel!
    @IBOutlet weak var rightNumbers: UILabel!
    @IBOutlet weak var weakIcon: UILabel!
    @IBOutlet weak var weakNumbers: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let labels = [self.labelFirst, self.labelSecond, self.labelThird, self.labelFourth, self.rightNumbers, self.weakNumbers]
        
        let white = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.7)
        
        for label in labels {
            label!.layer.cornerRadius = 0.5 * label!.bounds.size.width
            label!.layer.borderWidth = 2
            label!.layer.borderColor! = white.cgColor
        }
        
        rightIcon.font = UIFont.fontAwesome(ofSize: 20)
        rightIcon.text = String.fontAwesomeIcon(code: "fa-check-circle-o")
        
        weakIcon.font = UIFont.fontAwesome(ofSize: 20)
        weakIcon.text = String.fontAwesomeIcon(code: "fa-circle-o-notch")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
