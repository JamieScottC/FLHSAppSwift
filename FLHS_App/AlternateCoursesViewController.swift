//
//  AlternateCoursesViewController.swift
//  FLHS_App
//
//  Created by Drew Gregory on 7/13/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit

class AlternateCoursesViewController: UIViewController {

    var courseIndex : Int! //The course we are alternating...
    var days : [Day] = [] //All the custom course data
    var alt1s : [UISegmentedControl] = []
    var alt2s : [UISegmentedControl] = []
    
    @IBOutlet var alt1day1: UISegmentedControl!
    @IBOutlet var alt1day2: UISegmentedControl!
    @IBOutlet var alt1day3: UISegmentedControl!
    @IBOutlet var alt1day4: UISegmentedControl!
    @IBOutlet var alt1day5: UISegmentedControl!
    @IBOutlet var alt2day1: UISegmentedControl!
    @IBOutlet var alt2day2: UISegmentedControl!
    @IBOutlet var alt2day3: UISegmentedControl!
    @IBOutlet var alt2day4: UISegmentedControl!
    @IBOutlet var alt2day5: UISegmentedControl!
   
    @IBOutlet var firstCourseField: UITextField!
    @IBOutlet var secondCourseField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(courseIndex)
        // Do any additional setup after loading the view.
        //Load days
        days = ScheduleTableViewController.loadDays()!
        //Create arrays of alts so that they are easier to work with  (loops!)
        alt1s = [alt1day1, alt1day2, alt1day3, alt1day4, alt1day5]
        alt2s = [alt2day1, alt2day2, alt2day3, alt2day4, alt2day5]
        //Set Up layout
        //Find first course name and fill in text field
        firstCourseField.text = days[0].courses[courseIndex]
        //Find second course name and fill in text field
        var secondCourseName = ""
        for i in 1 ..< days.count { //Start at 1 because the second course name obviously cannot be where the first one is.
            if days[i].courses[courseIndex] != firstCourseField.text { //If this course name differs with first, we found it!
                secondCourseName = days[i].courses[courseIndex]
                //While we're at it, let's set up the toggles.
                //Check if index is on first half (A-E, so 0-4)
                if i <= 4 {
                    //Then change alt 2 toggle towards the first segment
                    alt2s[i].setEnabled(true, forSegmentAt: 0)
                } else {
                    //The index is on second half (1-5, so 5-9)
                    //Change alt 2 toggle so it is pointing towards second segment
                    alt2s[i - 5].setEnabled(true, forSegmentAt: 1)
                }
            } else {
                //Correct the first set of toggles
                //Check if index is on first half (A-E, so 0-4)
                if i <= 4 {
                    //then change alt 1 toggle towards the first segment
                    alt1s[i].setEnabled(true, forSegmentAt: 0)
                } else {
                    //The index is on second half (1-5, so 5-9)
                    //change alt 1 toggle so it is pointing towards first segment
                    alt1s[i - 5].setEnabled(true, forSegmentAt: 1)
                }
                
            }
        }
        //Update secondCourseField
        secondCourseField.text = secondCourseName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func saveAlternatingCourses(_ sender: Any) {
        //Go through each UISegment, then update course.
        //First, let's do the first set of toggles
    
        for i in 0 ..< alt1s.count {
            //Check how the toggle is set
            let alt1SegmentIndex = alt1s[i].selectedSegmentIndex
            if alt1SegmentIndex == 0 { //A-E
                //Update master array of custom course data
                days[i].courses[courseIndex] = firstCourseField.text!
                print("Day " + String(i) + " Course " + String(courseIndex + 1)  + " = " + firstCourseField.text!)
            } else { //1-5
                days[i + 5].courses[courseIndex] = firstCourseField.text!
                print("Day " + String(i + 5) + " Course " + String(courseIndex + 1) + " = " + firstCourseField.text!)
            }
            //Now, we do the same thing for the second set of toggles
            //Check how the toggle is set
            let alt2SegmentIndex = alt2s[i].selectedSegmentIndex
            if alt2SegmentIndex == 0 { //A-E
                //Update master array of custom course data
                days[i].courses[courseIndex] = secondCourseField.text!
                print("Day " + String(i) + " Course " + String(courseIndex + 1) + " = " + secondCourseField.text!)
            } else { //1-5
                days[i + 5].courses[courseIndex] = secondCourseField.text!
                print("Day " + String(i + 5) + " Course " + String(courseIndex + 1) + " = " + secondCourseField.text!)
            }
        }
        //Now lets save this new data!
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(days, toFile: Day.ArchiveURL.path)
        if isSuccessfulSave {
            print("Successfully saved schedule data for Course " + String(courseIndex + 1))
        } else {
            print("Unsuccessfully saved schedule data")
        }
        // Revert back to customized schedule (hopefully without segue)?
        navigationController?.popViewController(animated: true)

    }

}
