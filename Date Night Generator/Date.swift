//
//  Date.swift
//  Date Night Generator
//
//  Created by CIS Student on 9/13/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import Foundation
import UIKit
class Date {
    var location = ""
    var distanceFromUser = 0.0
    var name = ""
    var priceTag = ""
    var datetype = ""
    var IsSaved = false
    var IsDoubleDate = false
    var image: UIImage?
    
    init(location:String, distanceFromUser:Double, name:String, priceTag:String, type:String, photo: UIImage){
        self.location = location;
        self.distanceFromUser = distanceFromUser;
        self.name = name;
        self.priceTag = priceTag
        self.datetype = type
        self.image = photo
        
    }
}
