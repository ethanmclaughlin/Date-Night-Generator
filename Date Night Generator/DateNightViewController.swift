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
        Type_Segment.selectedSegmentIndex = 2
        Price_Segment.selectedSegmentIndex = 2
        Radius_Segment.selectedSegmentIndex = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var radiusLabel: UILabel!
    

    @IBOutlet weak var Radius_Segment: UISegmentedControl!
    
    
    @IBOutlet weak var Price_Segment: UISegmentedControl!
    
    
    @IBOutlet weak var Type_Segment: UISegmentedControl!
    
    @IBAction func NoFreeLunch(_ sender: UISegmentedControl) {
        if (Type_Segment.selectedSegmentIndex == 0){
            Price_Segment.setEnabled(false, forSegmentAt: 0)
        }
        else{
            Price_Segment.setEnabled(true, forSegmentAt: 0)
        }
    }

    
    
    

    

    
    public func generateDateObject() -> Date {

            let searchradius = Radius_Segment.selectedSegmentIndex
            var price = Price_Segment.selectedSegmentIndex
            let datetype = Type_Segment.selectedSegmentIndex
 
        let fakedata = FakeAPIList()
        
        let date = Date(activity: nil, meal: nil)
        
        //Pull from Google API everything that matches radius maximum and price maximum
        
        //Divide that list into 2 lists, activities and meals
        var activitydate: Activity
        var mealdate: Meal
        
        if (datetype == 0){
            //that's a meal only
            //populate a meal object with the info in an index from the meals list based on rng
            
            mealdate = mealRNG(fakedata: fakedata)
            while (!checkMeal(meal: mealdate, distanceSegment: searchradius, priceSegment: price)){
                mealdate = mealRNG(fakedata: fakedata)
                if (price == 0){
                    price = 1
                }
            }
            date.meal = mealdate

        }
        else if (datetype == 1){
            //This is activity only
            //populate an activity object with the info in an index from the activity list based on rng
            
            activitydate = activityRNG(fakedata: fakedata)
            while (!checkActivity(activity: activitydate, distanceSegment: searchradius, priceSegment: price)){
                activitydate = activityRNG(fakedata: fakedata)
            }
            date.activity = activitydate
            
        }
        else {
            //this is both
            
            //see above, but both
            mealdate = mealRNG(fakedata: fakedata)
            activitydate = activityRNG(fakedata: fakedata)
            
            date.activity = activitydate
            while (!checkMeal(meal: mealdate, distanceSegment: searchradius, priceSegment: price)){
                mealdate = mealRNG(fakedata: fakedata)
                if (price == 0){
                    price = 1
                }
            }
            date.meal = mealdate
            while (!checkActivity(activity: activitydate, distanceSegment: searchradius, priceSegment: price)){
                activitydate = activityRNG(fakedata: fakedata)
            }
            date.activity = activitydate
        }
        
        return date
    }
    
    public func mealRNG(fakedata: FakeAPIList) -> Meal{
        let random = Int(arc4random_uniform(UInt32(fakedata.mealList.count)))
        let meal = fakedata.mealList[random]
        return meal
    }
    
    public  func activityRNG(fakedata: FakeAPIList) -> Activity{
        let random = Int(arc4random_uniform(UInt32(fakedata.activityList.count)))
        let activity = fakedata.activityList[random]
        return activity
    }
    
    public func checkActivity(activity:Activity, distanceSegment: Int, priceSegment: Int) -> Bool{
        var priceasint:Int
        var distancecategories:Int
        switch (activity.priceTag){
            case ("$"):
                priceasint = 1
                break
            case ("$$"):
                priceasint = 2
                break
            case ("$$$"):
                priceasint = 3
                break
            case ("$$$$"):
                priceasint = 4
                break
            default:
                priceasint = 0
                break
        }
        if (activity.distanceFromUser <= 5.0){
            distancecategories = 0
        }
        else if (activity.distanceFromUser <= 10.0){
           distancecategories = 1
        }
        else if (activity.distanceFromUser <= 25.0){
            distancecategories = 2
        }
        else if (activity.distanceFromUser <= 50.0){
            distancecategories = 3
        }
        else {
            distancecategories = 4
        }
        
        if (priceasint <= priceSegment ){
            if (distancecategories <= distanceSegment){
                return true
            }
            else{
                return false
                
            }
        }
        else{
            return false
        }
    }
    
    public  func checkMeal(meal: Meal, distanceSegment: Int, priceSegment: Int) -> Bool{
        var priceasint:Int
        var distancecategories:Int
        switch (meal.priceTag){
        case ("$"):
            priceasint = 1
            break
        case ("$$"):
            priceasint = 2
            break
        case ("$$$"):
            priceasint = 3
            break
        case ("$$$$"):
            priceasint = 4
            break
        default:
            priceasint = 0
            break
        }
        if (meal.distanceFromUser <= 5.0){
            distancecategories = 0
        }
        else if (meal.distanceFromUser <= 10.0){
            distancecategories = 1
        }
        else if (meal.distanceFromUser <= 25.0){
            distancecategories = 2
        }
        else if (meal.distanceFromUser <= 50.0){
            distancecategories = 3
        }
        else {
            distancecategories = 4
        }
        
        if (priceasint <= priceSegment ){
            if (distancecategories <= distanceSegment){
                return true
            }
            else{
                return false
                
            }
        }
        else{
            return false
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let datedetailsVC = segue.destination as? DatesViewController{
            let generatedDateObject = generateDateObject()
            datedetailsVC.price = Price_Segment.selectedSegmentIndex
            datedetailsVC.searchradius = Radius_Segment.selectedSegmentIndex
            datedetailsVC.datetype = Type_Segment.selectedSegmentIndex
            datedetailsVC.date = generatedDateObject
        }
        

    }
    

}
