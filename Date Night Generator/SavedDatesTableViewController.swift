//
//  SavedDatesTableViewController.swift
//  Date Night Generator
//
//  Created by CIS Student on 11/13/17.
//  Copyright © 2017 Freed-hardeman University. All rights reserved.
//

import UIKit

class SavedDatesTableViewController: UITableViewController {
    var savedDates = [Date]()
    var passingDate = Date(activity: nil, meal: nil)
    private func LoadSavedDates(){
        let thumbnail1 = UIImage(named: "CasaMarina.jpg")
        let thumbnail2 = UIImage(named: "Sizzler.jpg")
        
        let saveMeal1 = Meal(location: "76 Old Hickory Blvd. Jackson, TN", distanceFromUser: 25.6, name: "Casa Marina", priceTag: "$$", photo: thumbnail1!)
        let saveMeal2 = Meal(location: "581 Old Hickory Blvd. Jackson, TN", distanceFromUser: 23.4, name: "Sizzler Indian Cuisine", priceTag: "$$$", photo: thumbnail2!)
        let saveDate1 = Date(activity: nil, meal: saveMeal1)
        let saveDate2 = Date(activity: nil, meal: saveMeal2)
        
        savedDates += [saveDate1, saveDate2]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        LoadSavedDates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedDates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SavedDatesTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SavedDatesTableViewCell
        let date = savedDates[indexPath.row]
        // Configure the cell...
        if (date.meal != nil){
            cell?.datetitle.text = date.meal?.name
            cell?.dateprice.text = date.meal?.priceTag
            cell?.thumbnail.image = date.meal?.image
        }
          return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passingDate = savedDates[indexPath.row]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let datedetailsVC = segue.destination as? DatesViewController{
            let generatedDateObject = passingDate
            datedetailsVC.date = generatedDateObject
        }
    }
    
}

