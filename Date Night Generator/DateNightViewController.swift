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
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var radiusLabel: UILabel!
    

    @IBOutlet weak var Radius_Segment: UISegmentedControl!
    
    
    @IBOutlet weak var Price_Segment: UISegmentedControl!
    
    
    @IBOutlet weak var Type_Segment: UISegmentedControl!
    
    
    
    @IBOutlet weak var goButton: UIButton!
    
    var Dates = [Date]()
    
    @IBAction func findDate(_ sender: UIButton){
        let searchradius = Radius_Segment.selectedSegmentIndex
        let price = Price_Segment.selectedSegmentIndex
        let datetype = Type_Segment.selectedSegmentIndex
        
        if (datetype == 0){
            //that's a meal only
            let thumbnail1 = UIImage(named: "CasaMarina.jpg")
            let mealDate = Date(location: "76 Old Hickory Blvd. Jackson, TN", distanceFromUser: 25.6, name: "Casa Marina", priceTag: "$$", type: "Meal", photo: thumbnail1!)
            Dates += [mealDate]
        }
        else if (datetype == 1){
            //This is activity only
            let thumbnail1 = UIImage(named: "Movie.jpg")
            let activityDate = Date(location: "575 Vann Dr. Jackson, TN", distanceFromUser: 25.6, name: "See a movie!", priceTag: "$$$$", type: "Activity", photo: thumbnail1!)
            Dates += [activityDate]
        }
        else {
            //this is both
            let thumbnail1 = UIImage(named: "Movie.jpg")
            let thumbnail2 = UIImage(named: "Sizzler.jpg")
            let mealDate = Date(location: "581 Old Hickory Blvd. Jackson, TN", distanceFromUser: 23.4, name: "Sizzler Indian Cuisine", priceTag: "$$$", type: "Meal", photo: thumbnail2!)
            let activityDate = Date(location: "575 Vann Dr. Jackson, TN", distanceFromUser: 25.6, name: "See a movie!", priceTag: "$$$$", type: "Activity", photo: thumbnail1!)
            Dates += [activityDate, mealDate]
        }
        
        let DateVC = storyboard?.instantiateViewController(withIdentifier: "DatesViewController") as! DatesViewController
        DateVC.Dates = Dates
        
        navigationController?.pushViewController(DateVC, animated: true)
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
