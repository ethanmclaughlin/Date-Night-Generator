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
    
    @IBOutlet weak var datetitle: UILabel!
    
    @IBOutlet weak var dateprice: UILabel!
    
    
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
