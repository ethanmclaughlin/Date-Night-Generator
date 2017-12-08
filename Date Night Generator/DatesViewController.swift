//
//  DatesViewController.swift
//  Date Night Generator
//
//  Created by CIS Student on 11/15/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import UIKit

class DatesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        if (date.meal == nil ){
            if (MealStackView != nil){
                MealStackView.removeFromSuperview()
                
            }
        }
        if (date.activity == nil){
            if (activityStackView != nil){
                activityStackView.removeFromSuperview()
            }
        }
        if (loadedsaveddateflag){
            TryAgainButton.isEnabled = false
        }
        populateDates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var activityStackView: UIStackView!
    @IBOutlet weak var activityThumbnail: UIImageView!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var activityAddress: UILabel!
    @IBOutlet weak var activityName: UILabel!
    
    @IBOutlet weak var MealStackView: UIStackView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealPrice: UILabel!
    
    @IBOutlet weak var mealAddress: UILabel!
    @IBOutlet weak var mealName: UILabel!

    @IBOutlet weak var superstackview: UIStackView!
    
    var loadedsaveddateflag = false
    var date = Date(activity: nil, meal: nil)
    var price = 0
    var searchradius = 0
    var datetype = 0
    
    @IBOutlet weak var TryAgainButton: UIButton!
    
    @IBAction func Rerolldate(_ sender: Any) {
        date = generateNewDateObject()
        viewDidLoad()
    }
    
    
    func populateDates(){
        if ((date.activity) != nil) {

            activityThumbnail.image = date.activity?.image
            activityPrice.text = date.activity?.priceTag
            activityAddress.text = date.activity?.location
            activityName.text = date.activity?.name
            
        }
        if ((date.meal) != nil){
  
            mealImage.image = date.meal?.image
            mealPrice.text = date.meal?.priceTag
            mealAddress.text = date.meal?.location
            mealName.text = date.meal?.name
        }
        
    }
    
    public func generateNewDateObject() -> Date {
        
        let fakedata = FakeAPIList()
        
        let rerolldate = Date(activity: nil, meal: nil)
        
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
            rerolldate.meal = mealdate
            
        }
        else if (datetype == 1){
            //This is activity only
            //populate an activity object with the info in an index from the activity list based on rng
            
            activitydate = activityRNG(fakedata: fakedata)
            while (!checkActivity(activity: activitydate, distanceSegment: searchradius, priceSegment: price)){
                activitydate = activityRNG(fakedata: fakedata)
            }
            rerolldate.activity = activitydate
            
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
            rerolldate.meal = mealdate
            while (!checkActivity(activity: activitydate, distanceSegment: searchradius, priceSegment: price)){
                activitydate = activityRNG(fakedata: fakedata)
            }
            rerolldate.activity = activitydate
        }
        
        return rerolldate
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
