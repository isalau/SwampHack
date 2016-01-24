//
//  ViewController.swift
//  DancinAroundTown
//
//  Created by Isabel Laurenceau on 1/23/16.
//  Copyright © 2016 Isabel Laurenceau. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var dayPicker: UIPickerView!
    @IBOutlet var classPicker: UIPickerView!
    
    var dayPickerData: [String] = [String]()
    var classPickerData: [String] = [String]()
    
    var classPicked: String!
    var dayPicked: String!
    
    @IBOutlet var homeButton: UIBarButtonItem!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        dayPicker.delegate = self
        dayPicker.dataSource = self
        
        classPicker.delegate = self
        classPicker.dataSource = self
        
        
        dayPickerData = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        classPickerData = ["Ballet","Contemporary", "Jazz", "Modern", "HipHop", "Lyrical", "Tap"]
        
        let background = CAGradientLayer().pruplegradient()
        background.frame = self.view.frame
        self.view.layer.insertSublayer(background, atIndex: 0)
        button.layer.cornerRadius = 7
        
       
        dayPicked = dayPickerData[0]
        classPicked = classPickerData[0]
        
        homeButton.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Hoefler Text", size: 20)!], forState: UIControlState.Normal)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == self.dayPicker) {
            return dayPickerData.count
        }
        else{
            return classPickerData.count
        }
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == self.dayPicker) {
            
            return dayPickerData[row]
        }
        else{
            return classPickerData[row]
        }
        dayPicked = dayPickerData[row]
        classPicked = classPickerData[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == self.dayPicker) {
             dayPicked = dayPickerData[row]
//            print("Day:\(dayPicked)")
        }
        else{
             classPicked = classPickerData[row]
//            print("Class:\(classPicked)")
        }
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        if (pickerView == self.dayPicker) {
            let pickerLabel = UILabel()
            let titleData = dayPickerData[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Hoefler Text", size: 20)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            pickerLabel.attributedText = myTitle
            pickerLabel.textAlignment = .Center
            return pickerLabel
        }
        else{
            let pickerLabel = UILabel()
            let titleData = classPickerData[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Hoefler Text", size: 20)!,NSForegroundColorAttributeName:UIColor.blackColor()])
            pickerLabel.attributedText = myTitle
            pickerLabel.textAlignment = .Center
            return pickerLabel
        }
    }

    
    @IBAction func Continue(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toList"
        {
            let lvc = segue.destinationViewController as! ListViewController;
            lvc.dayPicked = dayPicked
            lvc.classPicked = classPicked

            
        }
        
    }

}

