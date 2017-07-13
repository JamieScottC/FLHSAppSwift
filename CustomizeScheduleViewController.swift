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
    
    var days : [Day] = []
    var courseFields : [UITextField?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Load days
        days = ScheduleTableViewController.loadDays()!
        //Bundle coursefields into array; makes updating/extracting data less tedious
         courseFields = [course1Field, course2Field, course3Field, course4Field, course5Field, course6Field, course7Field,course8Field]
        //TODO: Update textfields with already saved custom course names
        //Go through each text field
        for i in 0 ... 7 {
            //Set text to already saved course name (using Day A)
            courseFields[i]?.text = days[0].courses[i]
        }
        
        
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
}
