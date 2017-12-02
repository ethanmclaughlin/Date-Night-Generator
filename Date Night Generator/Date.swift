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
    var meal:Meal?
    var activity:Activity?
    
    init (activity:Activity? , meal:Meal?){
        self.activity = activity
        self.meal = meal
    }
}
