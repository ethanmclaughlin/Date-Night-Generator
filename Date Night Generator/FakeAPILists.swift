//
//  FakeAPILists.swift
//  Date Night Generator
//
//  Created by CIS Student on 12/3/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import Foundation
import UIKit
class FakeAPIList{
    let mealList: [Meal] = [
        Meal(location: "76 Old Hickory Blvd. Jackson, TN", distanceFromUser: 25.6, name: "Casa Marina", priceTag: "$$", photo: UIImage(named: "CasaMarina.jpg")),
        Meal(location: "581 Old Hickory Blvd. Jackson, TN", distanceFromUser: 23.4, name: "Sizzler Indian Cuisine", priceTag: "$$$", photo: UIImage(named: "Sizzler.jpg"))
    ]
    
    let activityList: [Activity] = [
        Activity(location: "575 Vann Dr. Jackson, TN", distanceFromUser: 25.6, name: "See a movie!", priceTag: "$$$$", photo: UIImage(named: "Movie.jpg")),
        Activity(location: "20 Cabin Ln, Henderson, TN", distanceFromUser: 8.8, name: "Chickasaw State Park", priceTag: "Free", photo: UIImage(named: "Chicksaw.jpg"))
        
    ]
    
    
    
    init() {
        
    }
    
}
