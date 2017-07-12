//
//  ScheduleTableViewController.swift
//  FLHS_App
//
//  Created by Drew Gregory on 4/12/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit
import Parse
import Foundation

class ScheduleTableViewController: UITableViewController {
    
    @IBOutlet var DateButton: UIButton!
    @IBOutlet var SwitchLunchButton: UIBarButtonItem!
    
    let twoHourDelay5EarlyLunchTimes : [String] = ["9:45 - 10:10", "10:15 - 10:40", "10:45 - 11:10", "11:15 - 11:45", "11:50 - 12:15", "12:20 - 12:45", "12:50 - 1:15", "1:20 - 1:45", "1:50 - 2:15"]
    let twoHourDelay5MiddleLunchTimes : [String] = ["9:45 - 10:10", "10:15 - 10:40", "10:45 - 11:10", "11:15 - 11:40", "11:45 - 12:15", "12:20 - 12:45", "12:50 - 1:15", "1:20 - 1:45", "1:50 - 2:15"]
    let twoHourDelay5LateLunchTimes: [String] = ["9:45 - 10:10", "10:15 - 10:40", "10:45 - 11:10", "11:15 - 11:40", "11:45 - 12:10", "12:15 - 12:45", "12:50 - 1:15", "1:20 - 1:45", "1:50 - 2:15"]
    let twoHourDelayNormalTimes : [String] = ["9:45 - 10:20", "10:25 - 11:00", "11:05 - 11:40", "11:45 - 12:20", "12:25 - 1:00", "1:05 -1:40", "1:45 - 2:20"]
    let oneHourDelayEarlyLunchTimes: [String] = ["8:45 - 9:18", "9:23 - 9:56", "10:01 - 10:34", "10:39 - 11:09", "11:14 - 11:47", "11:52 - 12:25", "12:30 - 1:03", "1:08 - 1:41", "1:46 - 2:20"]
    let oneHourDelayMiddleLunchTimes: [String] = ["8:45 - 9:18", "9:23 - 9:56", "10:01 - 10:34", "10:39 - 11:12", "11:17 - 11:47", "11:52 - 12:25", "12:30 - 1:03", "1:08 - 1:41", "1:46 - 2:20"]
    let oneHourDelayLateLunchTimes : [String] = ["8:45 - 9:18", "9:23 - 9:56", "10:01 - 10:34", "10:39 - 11:12", "11:14 - 11:50", "11:55 - 12:25", "12:30 - 1:03", "1:08 - 1:41", "1:46 - 2:20"]
    let advLunch1Courses: [String] = ["Course 1", "Course 2", "Advisory", "Course 3", "Lunch", "Course 4", "Course 5", "Course 6", "Course 7", "Course 8"]
    let advLunch2Courses : [String] = ["Course 1", "Course 2", "Advisory", "Course 3", "Course 4", "Lunch", "Course 5", "Course 6", "Course 7", "Course 8"]
    let advLunch3Courses : [String] = ["Course 1", "Course 2", "Advisory", "Course 3", "Course 4", "Course 5", "Lunch", "Course 6", "Course 7", "Course 8"]
    let advLunch1Times: [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:30", "9:35 - 10:10", "10:15 - 10:55", "11:00 - 11:35", "11:40 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"]
    let advLunch2Times : [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:30", "9:35 - 10:10", "10:15 - 10:50", "10:55 - 11:35", "11:40 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"]
    let advLunch3Times : [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:30", "9:35 - 10:10", "10:15 - 10:50", "10:55 - 11:30", "11:35 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"]
    let collabCourses : [String] = ["Course 1", "Course 2", "Course 3", "Course 4", "Collab Learning Lunch", "Course 5", "Course 6", "Course 7", "Course 8"]
    let collabTimes : [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:40", "9:45 - 10:20", "10:25 - 11:35", "11:40 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"]
    let day1Lunch1Courses: [String] = ["Course 1", "Course 2", "Lunch", "Course 4", "Course 5", "Course 7", "Course 8"]
    let day1Lunch2Courses: [String] = ["Course 1", "Course 2", "Course 4", "Lunch", "Course 5", "Course 7", "Course 8"]
    let day1Lunch3Courses: [String] = ["Course 1", "Course 2", "Course 4", "Course 5", "Lunch", "Course 7", "Course 8"]
    let Lunch1Times : [String] = ["7:45 - 8:40", "8:45 - 9:40", "9:45 - 10:20", "10:25 - 11:20", "11:25 - 12:20", "12:25 - 1:20", "1:25 - 2:20"]
    let Lunch2Times : [String] = ["7:45 - 8:40", "8:45 - 9:40", "9:45 - 10:40", "10:45 - 11:20", "11:25 - 12:20", "12:25 - 1:20", "1:25 - 2:20"]
    let Lunch3Times: [String] = ["7:45 - 8:40", "8:45 - 9:40", "9:45 - 10:40", "10:45 - 11:40", "11:45 - 12:20", "12:25 - 1:20", "1:25 - 2:20"]
    let day2Lunch1Courses : [String] = ["Course 1", "Course 2", "Lunch", "Course 3", "Course 6", "Course 7", "Course 8"]
    let day2Lunch2Courses : [String] = ["Course 1", "Course 2", "Course 3", "Lunch", "Course 6", "Course 7", "Course 8"]
    let day2Lunch3Courses : [String] = ["Course 1", "Course 2", "Course 3", "Course 6", "Lunch", "Course 7", "Course 8"]
    let day3Lunch1Courses : [String] = ["Course 2", "Course 3", "Lunch", "Course 4", "Course 5", "Course 6", "Course 7"]
    let day3Lunch2Courses : [String] = ["Course 2", "Course 3", "Course 4", "Lunch", "Course 5", "Course 6", "Course 7"]
    let day3Lunch3Courses : [String] = ["Course 2", "Course 3", "Course 4", "Course 5", "Lunch", "Course 6", "Course 7"]
    let day4Lunch1Courses : [String] = ["Course 1", "Course 3", "Lunch", "Course 4", "Course 5", "Course 6", "Course 8"]
    let day4Lunch2Courses : [String] = ["Course 1", "Course 3", "Course 4", "Lunch", "Course 5", "Course 6", "Course 8"]
    let day4Lunch3Courses : [String] = ["Course 1", "Course 3", "Course 4", "Course 5", "Lunch", "Course 6", "Course 8"]
    let day5Lunch1Courses : [String] = ["Course 1", "Course 2", "Course 3", "Lunch", "Course 4", "Course 5", "Course 6", "Course 7", "Course 8"]
    let day5Lunch2Courses : [String] = ["Course 1", "Course 2", "Course 3", "Course 4", "Lunch", "Course 5", "Course 6", "Course 7", "Course 8"]
    let day5Lunch3Courses : [String] = ["Course 1", "Course 2", "Course 3", "Course 4", "Course 5", "Lunch", "Course 6", "Course 7", "Course 8"]
    let day5Lunch1Times : [String] = ["7:45 - 8:25", "8:30 - 9:10", "9:15 - 9:55", "10:00 - 10:30", "10:35 - 11:15", "11:20 - 12:00", "12:05 - 12:45", "12:50 - 1:30", "1:35 - 2:15"]
    let day5Lunch2Times : [String] = ["7:45 - 8:25", "8:30 - 9:10", "9:15 - 9:55", "10:00 - 10:40", "10:45 - 11:15", "11:20 - 12:00", "12:05 - 12:45", "12:50 - 1:30", "1:35 - 2:15"]
    let day5Lunch3Times : [String] = ["7:45 - 8:25", "8:30 - 9:10", "9:15 - 9:55", "10:00 - 10:40", "10:45 - 11:25", "11:30 - 12:00", "12:05 - 12:45", "12:50 - 1:30", "1:35 - 2:15"]
    
    
    var dayType = "A"
    var courses = [Course]()
    var queryDate : String!
    var lunchType : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Check if we have a pre-selected queryDate (chosen with date button)
        if (queryDate != nil) {
            //That's great! A date is already selected and sent through a segue.
        } else {
            //Shoot. A query date has not been selected with the date picker. We'll just have to use the current date instead.
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd"
            queryDate = formatter.string(from: date)
        }
        //Set the button text to the query date. This will orient the user as to which day they are viewing.
        DateButton.setTitle(queryDate, for: .normal)
        //Find Day Type we are trying to load schedule for
        getDay(queryDate: queryDate)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        //Return 1 section; sections are NOT cells
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //Return number of courses; changes depending on number of courses that day.
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleTableViewCell", for: indexPath) as? ScheduleTableViewCell else {
            fatalError("the identifier does not match ScheduleTableViewCell.swift")
        } //"dequeueReusableCell" reuses cells that go off the screen to save memory.
        //Initializes corresponding course for the cell we are trying to initalize
        let course = courses[indexPath.row]
        
        
        // Configure the cell...
        cell.courseName.text = course.name
        cell.courseTime.text = course.time
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadCourses(lunchType : String) {
        if dayType == "D" || dayType == "4" {
            if(lunchType == "early") {
                for index in 0 ... day4Lunch1Courses.count - 1 {
                    let course = Course(name: day4Lunch1Courses[index], time: Lunch1Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "middle") {
                for index in 0 ... day4Lunch2Courses.count - 1 {
                    let course = Course(name: day4Lunch2Courses[index], time: Lunch2Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "late") {
                for index in 0 ... day4Lunch1Courses.count - 1 {
                    let course = Course(name: day4Lunch3Courses[index], time: Lunch3Times[index])
                    courses.append(course)
                }
            }
        } else if dayType == "A" || dayType == "1" {
            if(lunchType == "early") {
                for index in 0 ... day1Lunch1Courses.count - 1 {
                    let course = Course(name: day1Lunch1Courses[index], time: Lunch1Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "middle") {
                for index in 0 ... day1Lunch2Courses.count - 1 {
                    let course = Course(name: day1Lunch2Courses[index], time: Lunch2Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "late") {
                for index in 0 ... day1Lunch1Courses.count - 1 {
                    let course = Course(name: day1Lunch3Courses[index], time: Lunch3Times[index])
                    courses.append(course)
                }
            }
        } else if dayType == "B" || dayType == "2" {
            if(lunchType == "early") {
                for index in 0 ... day2Lunch1Courses.count - 1 {
                    let course = Course(name: day2Lunch1Courses[index], time: Lunch1Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "middle") {
                for index in 0 ... day2Lunch2Courses.count - 1 {
                    let course = Course(name: day2Lunch2Courses[index], time: Lunch2Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "late") {
                for index in 0 ... day2Lunch1Courses.count - 1 {
                    let course = Course(name: day2Lunch3Courses[index], time: Lunch3Times[index])
                    courses.append(course)
                }
            }
        } else if dayType == "C" || dayType == "3" {
            if(lunchType == "early") {
                for index in 0 ... day3Lunch1Courses.count - 1 {
                    let course = Course(name: day3Lunch1Courses[index], time: Lunch1Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "middle") {
                for index in 0 ... day3Lunch2Courses.count - 1 {
                    let course = Course(name: day3Lunch2Courses[index], time: Lunch2Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "late") {
                for index in 0 ... day3Lunch1Courses.count - 1 {
                    let course = Course(name: day1Lunch3Courses[index], time: Lunch3Times[index])
                    courses.append(course)
                }
            }
        } else if dayType == "E" || dayType == "5" {
            if(lunchType == "early") {
                for index in 0 ... day1Lunch1Courses.count - 1 {
                    let course = Course(name: day1Lunch1Courses[index], time: Lunch1Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "middle") {
                for index in 0 ... day1Lunch2Courses.count - 1 {
                    let course = Course(name: day1Lunch2Courses[index], time: Lunch2Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "late") {
                for index in 0 ... day1Lunch1Courses.count - 1 {
                    let course = Course(name: day1Lunch3Courses[index], time: Lunch3Times[index])
                    courses.append(course)
                }
            }
        } else if dayType == "Adv E" || dayType == "Adv 5" {
            if(lunchType == "early") {
                for index in 0 ... advLunch1Courses.count - 1 {
                    let course = Course(name: advLunch1Courses[index], time: advLunch1Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "middle") {
                for index in 0 ... advLunch2Courses.count - 1 {
                    let course = Course(name: advLunch2Courses[index], time: Lunch2Times[index])
                    courses.append(course)
                }
            } else if (lunchType == "late") {
                for index in 0 ... day1Lunch1Courses.count - 1 {
                    let course = Course(name: day1Lunch3Courses[index], time: Lunch3Times[index])
                    courses.append(course)
                }
            }
        } else if dayType == "Collab E" || dayType == "Collab 5"{
            for index in 0 ... collabCourses.count - 1 {
                let course = Course(name: collabCourses[index], time: collabTimes[index])
                courses.append(course)
            }
        }
        
    }
    
    private func getDay(queryDate: String) {
        //TODO: Let querydate be something other than 'currentDate'
        //Retrives date from phone
        
        
        //Get Parse Config Data
        PFConfig.getInBackground { (config, error) in
            let dates = config?["WhatDay"] as! Array<String>
            //Go through each day item.
            for index in 0 ... (dates.count) - 1 {
                let strIndex = dates[index].index((dates[index].startIndex), offsetBy: 5)
                let subDate = dates[index].substring(to: strIndex)
                //If this particular date matches the queryDate...
                if subDate == queryDate {
                    //Get and set the day code
                    let strDayIndex = dates[index].index((dates[index].startIndex), offsetBy: 6)
                     self.dayType = dates[index].substring(from: strDayIndex)
                    //Get lunch
                    let lunch : String = self.getLunch().lowercased()
                    //Load the courses.
                     self.loadCourses(lunchType: lunch)
                    //Let's display this schedule!
                     self.tableView.reloadData()
                }
            }
        
        }
        
        //TODO: Return nil and handle no day found.
        
        
    }
    
    private func getLunch() -> String {
        //TODO: Determine method for getting Lunches...
        if (lunchType != nil) {
            //Preselected. Let's follow that.
            return lunchType
        }
        return "early"
    }
    
    //MARK: Persisting Data
    
    private func saveQueryDate(queryDate: String) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(queryDate, toFile: UserScheduleData.ArchiveURL.path)
        if isSuccessfulSave {
            print("Successfully saved query date")
        } else {
            print("Unsuccessfully saved query date")
        }
    }
    
    private func loadQueryDate() -> UserScheduleData? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: UserScheduleData.ArchiveURL.path) as? UserScheduleData
    }
    
    
    @IBAction func switchLunch(_ sender: Any) {
        
    }
    
    
}
