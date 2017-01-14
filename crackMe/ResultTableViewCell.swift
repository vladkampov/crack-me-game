//
//  ResultTableViewCell.swift
//  crackMe
//
//  Created by Vlad Kampov on 1/14/17.
//  Copyright © 2017 Vlad Kampov. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    @IBOutlet weak var labelFourth: UILabel!
    
    @IBOutlet weak var rightNumbers: UILabel!
    @IBOutlet weak var weakNumbers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
