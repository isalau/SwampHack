//
//  StudioViewController.swift
//  DancinAroundTown
//
//  Created by Isabel Laurenceau on 1/23/16.
//  Copyright © 2016 Isabel Laurenceau. All rights reserved.
//

import UIKit
import Parse

class StudioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var Name: UITextField!
    @IBOutlet var Time: UITextField!
    @IBOutlet var Location: UITextField!
    @IBOutlet var Cost: UITextField!
    @IBOutlet var Link: UITextField!
    
    @IBOutlet var dayPicker: UIPickerView!
    @IBOutlet var classPicker: UIPickerView!
    
    var dayPickerData: [String] = [String]()
    var classPickerData: [String] = [String]()
    
    var classPicked: String!
    var dayPicked: String!

    @IBOutlet var Button: UIButton!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Name.delegate = self
        self.Time.delegate = self
        self.Location.delegate = self
        self.Cost.delegate = self
        self.Link.delegate = self
        
        self.dayPicker.delegate = self
        self.dayPicker.dataSource = self
        
        self.classPicker.delegate = self
        self.classPicker.dataSource = self
        
        dayPickerData = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        classPickerData = ["Ballet","Contemporary", "Jazz", "Modern", "HipHop", "Lyrical", "Tap"]
        
        let background = CAGradientLayer().pruplegradient()
        background.frame = self.view.frame
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        
        Button.layer.cornerRadius = 7
        dayPicked = dayPickerData[0]
        classPicked = classPickerData[0]
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x>0 {
            scrollView.contentOffset.x = 0
        }
        if scrollView.contentOffset.x<0 {
            scrollView.contentOffset.x = 0
        }
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



    @IBAction func Submit(sender: AnyObject) {
        
        let Event = PFObject(className: "TestObject")
        Event.setObject(self.Name.text!, forKey: "Studio")
        Event.setObject(self.Time.text!, forKey: "Time")
        Event.setObject(self.Location.text!, forKey: "Location")
        Event.setObject(self.Cost.text!, forKey: "Cost")
        Event.setObject(self.Link.text!, forKey: "Link")
        Event.setObject(self.dayPicked, forKey: "Day")
        Event.setObject(self.classPicked, forKey: "Style")
        
        Event.saveInBackgroundWithBlock {
            (success: Bool, error:NSError?) -> Void in
            
            if(success)
            {
                //We saved our information
                print("Saved New Event")
                self.performSegueWithIdentifier("SaveToHome", sender: nil)
            }
            else
            {
                //there was a problem
                print(error)
                print("Error: Did Not Save Event")
            }
        }

    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        Name.resignFirstResponder()
        textField.resignFirstResponder()
        return true
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
