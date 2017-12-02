//
//  Meal.swift
//  Date Night Generator
//
//  Created by CIS Student on 11/27/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import Foundation
import UIKit

class Meal{
    var location = ""
    var distanceFromUser = 0.0
    var name = ""
    var priceTag = ""
    var image: UIImage?
    
    init(location:String, distanceFromUser:Double, name:String, priceTag:String, photo: UIImage){
        self.location = location;
        self.distanceFromUser = distanceFromUser;
        self.name = name;
        self.priceTag = priceTag
        self.image = photo
        
    }
}

