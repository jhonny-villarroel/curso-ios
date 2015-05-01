//
//  TableRestaurantsTableViewController.swift
//  newPod
//
//  Created by test on 4/28/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit
import SwiftHTTP
import ObjectMapper


class TableRestaurantsTableViewController: UITableViewController {
    var listRestaurant:Array<AnyObject> = []
    
    override func viewDidLoad() {
        println("Load....")
        
        super.viewDidLoad()
        
    }

    override func viewDidAppear(animated: Bool) {
        
        var request = HTTPTask()
        request.GET("http://mongondb.cloudapp.net:3000/restaurants", parameters: nil, success: {(response: HTTPResponse) in
            // data is the stream that return the server
            if let data = response.responseObject as? NSData {
                // convert data to String
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
               // error handler
                var jsonErrorOptional: NSError?
                // parse to JSON
                let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonErrorOptional)
                // Convert JSON to Array [ { }, {json}]
                if let statusArray: Array<AnyObject> = jsonOptional as? Array{      // iterate array
                    // map a list of restaurant from array
                    self.listRestaurant = Mapper<Restaurant>().mapArray(statusArray)!
                    // refresh table
                    self.tableView.reloadData()

                }
                
            }
            },failure: {(error: NSError, response: HTTPResponse?) in
                println("error: \(error)")
        })

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        println("rest count \(self.listRestaurant.count)")
        return self.listRestaurant.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellID: NSString = "Cell"
        //var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID) as UITableViewCell
        //cell.textLabel!.text = "test"
        
        var restaurant:Restaurant = self.listRestaurant[indexPath.row] as Restaurant
        cell.textLabel?.text = restaurant.name
        
        return cell

    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
