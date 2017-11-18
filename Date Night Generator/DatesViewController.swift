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
        populateDates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var dateimage: UIImageView!
    
    @IBOutlet weak var pricelabel: UILabel!
    
    @IBOutlet weak var addresslabel: UILabel!
    
    @IBOutlet weak var gobutton: UIButton!
    
    @IBOutlet weak var reviewsbutton: UIButton!
    
    @IBOutlet weak var rerollbutton: UIButton!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    var Dates = [Date]()
    
    
    func populateDates(){
        for Date in Dates{
            
            dateimage.image = Date.image
            pricelabel.text = Date.priceTag
            addresslabel.text = Date.location
            
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
