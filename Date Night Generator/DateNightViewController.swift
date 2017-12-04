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
        let randomNumber = Int(arc4random_uniform(UInt32(max)))
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
        
        let fakedata = FakeAPIList()
        
        let date = Date(activity: nil, meal: nil)
        
        //Pull from Google API everything that matches radius maximum and price maximum
        
        //Divide that list into 2 lists, activities and meals
        var activitydate: Activity
        var mealdate: Meal
        
        if (datetype == 0){
            //that's a meal only
            //populate a meal object with the info in an index from the meals list based on rng
            
            if (price < 3){
                mealdate = fakedata.mealList[getRNG(max: fakedata.mealList.count)]
            }
            else{
                mealdate = fakedata.mealList[1]
            }
            date.meal = mealdate
        }
        else if (datetype == 1){
            //This is activity only
            //populate an activity object with the info in an index from the activity list based on rng
            
            if (price < 3){
                activitydate = fakedata.activityList[1]
            }
            else{
                activitydate = fakedata.activityList[getRNG(max: fakedata.activityList.count)]
            }
            date.activity = activitydate
        }
        else {
            //this is both
            
            //see above, but both
            if (price < 3){
                mealdate = fakedata.mealList[getRNG(max: fakedata.mealList.count)]
                activitydate = fakedata.activityList[1]
            }
            else{
                activitydate = fakedata.activityList[getRNG(max: fakedata.activityList.count)]
                mealdate = fakedata.mealList[1]
            }
            date.activity = activitydate
            date.meal = mealdate
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
