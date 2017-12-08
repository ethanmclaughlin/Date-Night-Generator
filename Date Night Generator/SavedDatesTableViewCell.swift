//
//  SavedDatesTableViewCell.swift
//  Date Night Generator
//
//  Created by CIS Student on 11/13/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import UIKit

class SavedDatesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var mealprice: UILabel!
    @IBOutlet weak var mealname: UILabel!
    @IBOutlet weak var activityprice: UILabel!
    @IBOutlet weak var activityname: UILabel!

    @IBOutlet weak var mealstack: UIStackView!
    @IBOutlet weak var activitystack: UIStackView!

    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
