//
//  CustomizeScheduleViewController.swift
//  FLHS_App
//
//  Created by Drew Gregory on 7/13/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit

class CustomizeScheduleViewController: UIViewController {
    @IBOutlet var course1Field: UITextField!
    @IBOutlet var course2Field: UITextField!
    @IBOutlet var course3Field: UITextField!
    @IBOutlet var course4Field: UITextField!
    @IBOutlet var course5Field: UITextField!
    @IBOutlet var course6Field: UITextField!
    @IBOutlet var course7Field: UITextField!
    @IBOutlet var course8Field: UITextField!
    
    @IBOutlet var alt1: UIButton!
    @IBOutlet var alt2: UIButton!
    @IBOutlet var alt3: UIButton!
    @IBOutlet var alt4: UIButton!
    @IBOutlet var alt5: UIButton!
    @IBOutlet var alt6: UIButton!
    @IBOutlet var alt7: UIButton!
    @IBOutlet var alt8: UIButton!
    
    var days : [Day] = []
    var courseFields : [UITextField?] = []
    var altButtons : [UIButton?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Load days
        days = ScheduleTableViewController.loadDays()!
        //Bundle coursefields and altbuttons into arrays; makes updating/extracting data less tedious
         courseFields = [course1Field, course2Field, course3Field, course4Field, course5Field, course6Field, course7Field,course8Field]
        altButtons = [alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8]
        //Update textfields with already saved custom course names
        //Go through each text field
        for i in 0 ... 7 {
            //Set text to already saved course name (using Day A)
            courseFields[i]?.text = days[0].courses[i]
            //We now check which courses alternate
            if alternates(index: i) {
                //If this course alternates, change colors to make it look "toggled"
                altButtons[i]?.backgroundColor = UIColor.red
                altButtons[i]?.setTitleColor(UIColor.white, for: .normal)
            }
        }
        
        
        
        
    }

    func alternates (index: Int) -> Bool {
        
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAlternate" {
            let VC = segue.destination as! AlternateCoursesViewController
            let index =  sender as! Int
            VC.courseIndex = index
        }

    }
    
    
    private func updateCourse (index: Int, name: String) {
        
    }

    @IBAction func saveCustomizedSchedule(_ sender: Any) {
        print(course1Field.text!)
        //Go through each course field
        for i in 0...7 {
            //TODO: Check if alternating
            //If not alternating, go through each day
            for j in 0...9 {
                //Update field
                days[j].courses[i] = (courseFields[i]?.text!)!
            }
        }
        //Save the newly updated days array to disk
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(days, toFile: Day.ArchiveURL.path)
        if isSuccessfulSave {
            print("Successfully saved schedule data")
        } else {
            print("Unsuccessfully saved schedule data")
        }

    }
    
    //Sorry, this function was named poorly...this handles the toggling of alternating. If the button toggles alternating to true, THEN it will open an alternating window (perform segue)
    @IBAction func openAltWindow(_ sender: Any) {
        //Make sure the object that triggers this is a button.
        guard let button = sender as? UIButton else {
            return
        }
        if (button.backgroundColor != UIColor.red) {
            //Not toggled yet, so let's open a window!
            //button.tag has number that corresponds with course number (i.e. 1 for "Course 1")
            performSegue(withIdentifier: "showAlternate", sender: (button.tag - 1))
        }
    }
}
