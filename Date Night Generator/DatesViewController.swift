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
        MealStackView.removeFromSuperview()
        activityStackView.removeFromSuperview()
        
        if date.meal != nil {
            scrollview.addSubview(MealStackView)
        }
        if date.activity != nil{
            scrollview.addSubview(activityStackView)
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
    
    @IBOutlet weak var scrollview: UIScrollView!
    var date = Date(activity: nil, meal: nil)
    
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
