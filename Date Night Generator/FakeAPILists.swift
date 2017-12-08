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
        Meal(location: "204 S Church Ave, Henderson, TN", distanceFromUser: 0.3, name: "Bell's Drive In", priceTag: "$", photo: UIImage(named: "Bells")),
        Meal(location: "119 E Main St, Henderson, TN", distanceFromUser: 0.1, name: "China King", priceTag: "$", photo: UIImage(named:"ChinaKing")),
        Meal(location: "71 Carriage House Dr, Jackson, TN", distanceFromUser: 21.5, name: "Tulum Fresh Mexican Grill", priceTag: "$", photo: UIImage(named: "Tulum")),
        Meal(location: "76 Old Hickory Blvd. Jackson, TN", distanceFromUser: 25.6, name: "Casa Marina", priceTag: "$$", photo: UIImage(named: "CasaMarina")),
        Meal(location: "605 Carriage House Dr J, Jackson, TN ", distanceFromUser: 24.7, name: "Thai Cafe", priceTag: "$$", photo: UIImage(named: "ThaiCafe")),
        Meal(location: "581 Old Hickory Blvd. Jackson, TN", distanceFromUser: 23.4, name: "Sizzler Indian Cuisine", priceTag: "$$$", photo: UIImage(named: "Sizzler")),
        
    ]
    
    let activityList: [Activity] = [
        Activity(location: "Anywhere", distanceFromUser: 0.0, name: "Watch some Netflix", priceTag: "Free", photo: UIImage(named: "netflix")),
        Activity(location: "455 N Church Ave, Henderson, TN", distanceFromUser: 1.3, name: "Gene Record Memorial Park", priceTag: "Free", photo: UIImage(named: "GeneRecord")),
        Activity(location: "20 Cabin Ln, Henderson, TN", distanceFromUser: 8.8, name: "Chickasaw State Park", priceTag: "Free", photo: UIImage(named: "Chickasaw")),
        Activity(location: "217 E Deaderick St #105, Jackson, TN", distanceFromUser: 17.7, name: "Jackson Escape Rooms", priceTag: "$$$", photo: UIImage(named: "EscapeRooms")),
        Activity(location: "48 Casey Jones Ln, Jackson, TN", distanceFromUser: 22.1, name: "Casey Jones Mini Golf", priceTag: "$", photo: UIImage(named: "MiniGolf")),
        Activity(location: "59 Bowling Dr, Jackson, TN", distanceFromUser: 25.4, name: "Go Bowling!", priceTag: "$$", photo: UIImage(named: "Bowling")),
        Activity(location: "575 Vann Dr. Jackson, TN", distanceFromUser: 25.6, name: "See a movie!", priceTag: "$$$$", photo: UIImage(named: "Movie")),
        Activity(location: "2000 Prentiss Pl, Memphis, TN", distanceFromUser: 82.3, name: "Go to the Memphis Zoo", priceTag: "$$", photo: UIImage(named: "Zoo"))
        
        
    ]
    
    
    
    init() {
        
    }
    
}
