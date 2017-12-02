//
//  DateNightViewController.swift
//  Date Night Generator
//
//  Created by CIS Student on 9/6/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import UIKit

class DateNightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getRNG(max:Int) -> Int{
        let rngMax = max + 1
        let randomNumber = Int(arc4random_uniform(UInt32(rngMax)))
        return randomNumber
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var radiusLabel: UILabel!
    

    @IBOutlet weak var Radius_Segment: UISegmentedControl!
    
    
    @IBOutlet weak var Price_Segment: UISegmentedControl!
    
    
    @IBOutlet weak var Type_Segment: UISegmentedControl!
    
    
    
    
    

    

    
    private func generateDateObject() -> Date {
        let searchradius = Radius_Segment.selectedSegmentIndex
        let price = Price_Segment.selectedSegmentIndex
        let datetype = Type_Segment.selectedSegmentIndex
        
        var date = Date(activity: nil, meal: nil)
        
        //Pull from Google API everything that matches radius maximum and price maximum
        
        //Divide that list into 2 lists, activities and meals
        
        if (datetype == 0){
            //that's a meal only
            //populate a meal object with the info in an index from the meals list based on rng
            let thumbnail1 = UIImage(named: "CasaMarina.jpg")
            let mealDate = Meal(location: "76 Old Hickory Blvd. Jackson, TN", distanceFromUser: 25.6, name: "Casa Marina", priceTag: "$$", photo: thumbnail1!)
            date.meal = mealDate
        }
        else if (datetype == 1){
            //This is activity only
            //populate an activity object with the info in an index from the activity list based on rng
            let thumbnail1 = UIImage(named: "Movie.jpg")
            let activityDate = Activity(location: "575 Vann Dr. Jackson, TN", distanceFromUser: 25.6, name: "See a movie!", priceTag: "$$$$", photo: thumbnail1!)
            date.activity = activityDate
        }
        else {
            //this is both
            
            //see above, but both
            let thumbnail1 = UIImage(named: "Movie.jpg")
            let thumbnail2 = UIImage(named: "Sizzler.jpg")
            let mealDate = Meal(location: "581 Old Hickory Blvd. Jackson, TN", distanceFromUser: 23.4, name: "Sizzler Indian Cuisine", priceTag: "$$$", photo: thumbnail2!)
            let activityDate = Activity(location: "575 Vann Dr. Jackson, TN", distanceFromUser: 25.6, name: "See a movie!", priceTag: "$$$$", photo: thumbnail1!)
            date.meal = mealDate
            date.activity = activityDate
        }
        
        return date
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let datedetailsVC = segue.destination as? DatesViewController{
            let generatedDateObject = generateDateObject()
            datedetailsVC.date = generatedDateObject
        }
        

    }
    

}
