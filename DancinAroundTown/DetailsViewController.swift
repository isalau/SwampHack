//
//  DetailsViewController.swift
//  DancinAroundTown
//
//  Created by Isabel Laurenceau on 1/23/16.
//  Copyright © 2016 Isabel Laurenceau. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var StudioGiverd: String!
    var TimeGiverd: String!
    var LocationGiverd: String!
    var CostGiverd: String!
    var DetailsGiverd: String!
    var LinkGiverd: String!
    var dayPickedd: String!
    var classPickedd: String!
    
    @IBOutlet var Studio: UILabel!
    @IBOutlet var Time: UILabel!
    @IBOutlet var Location: UILabel!
    @IBOutlet var Cost: UILabel!
    @IBOutlet var Link: UIButton!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let background = CAGradientLayer().pruplegradient()
        background.frame = self.view.frame
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        Studio.text = StudioGiverd
        Time.text = TimeGiverd
        Location.text = LocationGiverd
        Cost.text = CostGiverd
//        Details.text = DetailsGiver
        Link.setTitle(LinkGiverd, forState: .Normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Register(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:LinkGiverd)!)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BackToTable"
        {
            let lvc = segue.destinationViewController as! ListViewController;
            lvc.dayPicked = dayPickedd
            lvc.classPicked = classPickedd
        }
        
    }


}
