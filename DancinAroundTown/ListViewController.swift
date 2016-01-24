//
//  ListViewController.swift
//  DancinAroundTown
//
//  Created by Isabel Laurenceau on 1/23/16.
//  Copyright © 2016 Isabel Laurenceau. All rights reserved.
//

import UIKit
import Parse
var studios = [String]()
var times = [String]()
var costs = [String]()
var locations = [String]()
var links = [String]()

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var Table: UITableView!
    var classPicked: String!
    var dayPicked: String!
    
    var StudioGiver: String!
    var TimeGiver: String!
    var LocationGiver: String!
    var CostGiver: String!
    var DetailsGiver: String!
    var LinkGiver: String!
    
    @IBOutlet var FoundNo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studios.removeAll()
        times.removeAll()
        costs.removeAll()
        locations.removeAll()
        links.removeAll()
        print("Class:\(classPicked)")
        print("Day:\(dayPicked)")
        
        queryForTable()
        
        let background = CAGradientLayer().pruplegradient()
        background.frame = self.view.frame
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        FoundNo.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    
    func queryForTable() -> PFQuery {
        var query = PFQuery(className:"TestObject")
        query.whereKey("Day", equalTo:(dayPicked)!)
        query.whereKey("Style", equalTo:(classPicked)!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                if objects!.count == 0{
                    print("found nothing")
                    self.FoundNo.hidden = false
                    self.FoundNo.text = "Sorry No Classes Found"
                }
                else{
                print("Successfully retrieved \(objects!.count) studios.")
                // Do something with the found objects
                for studio in  objects!{
                    let studioName = studio["Studio"] as! String
                    let timeName = studio["Time"] as! String
                    let costName = studio["Cost"] as! String
                    let locationName = studio["Location"] as! String
                    let linkName = studio["Link"] as! String
                    studios.append(studioName)
                    times.append(timeName)
                    costs.append(costName)
                    locations.append(locationName)
                    links.append(linkName)

                    self.Table.reloadData()
                }
                }
            }
            else {
                print("found nothing")
                self.FoundNo.hidden = false
            }
        }
        
        return query
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let name = studios[indexPath.row]
        let time = times[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = name
        cell.textLabel?.font = UIFont (name: "Hoefler Text ", size: 30)
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.detailTextLabel?.text = time
        cell.detailTextLabel?.textColor = UIColor.blackColor()
        cell.detailTextLabel?.font = UIFont (name: "Hoefler Text ", size: 20)
        
        cell.backgroundColor = UIColor.clearColor();
     
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let name = studios[indexPath.row]
        let time = times[indexPath.row]
        let cost = costs[indexPath.row]
        let location = locations[indexPath.row]
        let link = links[indexPath.row]

         StudioGiver = name
         TimeGiver = time
         LocationGiver = location
         CostGiver = cost
        LinkGiver = link
 
//         DetailsGiver: String!
        self.performSegueWithIdentifier("TabletoDetails", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
        return studios.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TabletoDetails"
        {
            let dvc = segue.destinationViewController as! DetailsViewController;
            dvc.StudioGiverd = StudioGiver
            dvc.TimeGiverd = TimeGiver
            dvc.LocationGiverd = LocationGiver
            dvc.CostGiverd = CostGiver
            dvc.LinkGiverd = LinkGiver
            dvc.dayPickedd = dayPicked
            dvc.classPickedd = classPicked
            
//            print("Studio:\(StudioGiver)")
//            print("Time:\(TimeGiver)")
//            print("Cosr:\(LocationGiver)")
//            print("Link:\(CostGiver)")
//            print("Link:\(dayPicked)")
//            print("Link:\(classPicked)")
        }
    }
}
