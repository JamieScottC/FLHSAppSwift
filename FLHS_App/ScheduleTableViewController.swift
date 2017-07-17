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
    let oneHourDelayEarlyLunchTimes1 = ["8:45 - 9:30", "9:35 - 10:20", "10:25 - 11:00","11:05 - 11:50","11:55 - 12:40","12:45 - 1:30", "1:35 - 2:20"] //For all days except E/5 (A,1,B,2,C,3,D,4)
    let oneHourDelayMiddleLunchTimes1 = ["8:45 - 9:30", "9:35 - 10:20", "10:25 - 11:10","11:15 - 11:50","11:55 - 12:40","12:45 - 1:30", "1:35 - 2:20"]
    let oneHourDelayLateLunchTimes1 = ["8:45 - 9:30", "9:35 - 10:20", "10:25 - 11:10","11:15 - 12:00","12:05 - 12:40","12:45 - 1:30", "1:35 - 2:20"]
    let oneHourDelayEarlyLunchTimes: [String] = ["8:45 - 9:18", "9:23 - 9:56", "10:01 - 10:34", "10:39 - 11:09", "11:14 - 11:47", "11:52 - 12:25", "12:30 - 1:03", "1:08 - 1:41", "1:46 - 2:20"] //For E/5 Days
    let oneHourDelayMiddleLunchTimes: [String] = ["8:45 - 9:18", "9:23 - 9:56", "10:01 - 10:34", "10:39 - 11:12", "11:17 - 11:47", "11:52 - 12:25", "12:30 - 1:03", "1:08 - 1:41", "1:46 - 2:20"]
    let oneHourDelayLateLunchTimes : [String] = ["8:45 - 9:18", "9:23 - 9:56", "10:01 - 10:34", "10:39 - 11:12", "11:14 - 11:50", "11:55 - 12:25", "12:30 - 1:03", "1:08 - 1:41", "1:46 - 2:20"]
    let advLunch1Courses: [String] = ["Course 1", "Course 2", "Advisory", "Course 3", "Lunch", "Course 4", "Course 5", "Course 6", "Course 7", "Course 8"]
    let advLunch2Courses : [String] = ["Course 1", "Course 2", "Advisory", "Course 3", "Course 4", "Lunch", "Course 5", "Course 6", "Course 7", "Course 8"]
    let advLunch3Courses : [String] = ["Course 1", "Course 2", "Advisory", "Course 3", "Course 4", "Course 5", "Lunch", "Course 6", "Course 7", "Course 8"]
    let advLunch1Times: [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:30", "9:35 - 10:10", "10:15 - 10:55", "11:00 - 11:35", "11:40 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"] //For E or 5 days
    let advLunch2Times : [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:30", "9:35 - 10:10", "10:15 - 10:50", "10:55 - 11:35", "11:40 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"]
    let advLunch3Times : [String] = ["7:45 - 8:20", "8:25 - 9:00", "9:05 - 9:30", "9:35 - 10:10", "10:15 - 10:50", "10:55 - 11:30", "11:35 - 12:15", "12:20 - 12:55", "1:00 - 1:35", "1:40 - 2:15"]
    let advOtherLunch2Times : [String] = ["7:45 - 8:35", "8:40 - 9:30", "9:35 - 10:00", "10:05 - 10:55", "11:00 - 11:35", "11:40 - 12:30", "12:35 - 1:25", "1:30 - 2:20"] //For days "other" than E or 5
    let advOtherLunch1Times : [String] = ["7:45 - 8:35", "8:40 - 9:30", "9:35 - 10:00", "10:05 - 10:40", "10:45 - 11:35", "11:40 - 12:30", "12:35 - 1:25", "1:30 - 2:20"]
    let advOtherLunch3Times : [String] = ["7:45 - 8:35", "8:40 - 9:30", "9:35 - 10:00", "10:05 - 10:55", "11:00 - 11:50", "11:55 - 12:30", "12:35 - 1:25", "1:30 - 2:20"]
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
    
    
    var dayType = "" //determines day type that we are trying to display today. (Ex: "", "CLB", "ADV", "1HD", "2HD", "~<NameofSpecial>")
    var dayLetter = "A"
    var courses = [Course]() //this is the master list that is displayed in the table view
    var customDays : [Day]? //days with course names replaced with personal course names ("French" instead of "Course 1")
    var queryDate : String!
    var lunchType : String!
    var config : PFConfig? = nil//instance variable particularly for special schedules.
    var trackOptions : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //Most my set up code is on ViewWillAppear instead so that when the back button is pressed, the screen updates.
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //In case we revisit the page (after changing lunch, for example), let's clear the courses
        courses = []
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
        
        print(queryDate)
        if (self.lunchType != nil) {
            print(self.lunchType)
        } else {
            print("lunchType is nil")
        }
        
        //Set the button text to the query date. This will orient the user as to which day they are viewing.
        DateButton.setTitle(queryDate, for: .normal)
        //Load custom schedule data
        customDays = ScheduleTableViewController.loadDays()
        //If loading the days was unsuccessful, generate the base plate (probably first time user ran schedule portion of app)
        if (customDays == nil) {
            //There is no user saved data. We will generate the default settings now.
            customDays = generateDays()
        }
        
        
        
        //Find Day Type we are trying to load schedule for
        getDay(queryDate: queryDate)

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
        //Find custom course name (Ex:"Course 1" -> "French")
        //Begin by getting course number - should be last character of name
        let index = course.name.index(course.name.endIndex, offsetBy: -1)
        let shouldBeNumberString = course.name.substring(from: index)
        //Try to convert this string shouldBeNumber into a number.
        let shouldBeNumber = Int(shouldBeNumberString)
        //Check if character is a number
        if (shouldBeNumber != nil) {
            //If this character is a number, then we can assume it is a replacable course!
            //Use number as index for days array (since index is 0-based, subtract 1)
            course.name = (customDays?[ScheduleTableViewController.translateDayToIndex(dayString: self.dayLetter)].courses[shouldBeNumber! - 1])!
        } else {
            //It wasn't a number. Let's leave it be. It's not a generic course (Ex: "Assembly")
        }
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

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "switchLunchSegue" {
            let VC = segue.destination as! SwitchLunchTableViewController
            //Check if special schedule or not by checking if trackOptions is empty
            if (trackOptions.count == 0) { //Not special
                let dayLetter =  sender as! String
                VC.dayType = dayLetter
            } else { //Special
                //Replace "Early", "Middle", and "Late" with the track options
                //For more info on special schedules, check out the README
                VC.items = trackOptions
                VC.dayType = "~"
                VC.delegate = self
            }
            
        }
    }
 
    
    private func loadCourses(lunchType : String) {
        //In this function, we generate an array of courses. These courses are objects (defined in Course.swift) that have both a name and time field for each course.
        switch (dayType) {
            case "": //Regular day (A-E or 1-5)
                if dayLetter == "D" || dayLetter == "4" {
                    if (lunchType == "early") {
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
                } else if dayLetter == "A" || dayLetter == "1" {
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
                } else if dayLetter == "B" || dayLetter == "2" {
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
                } else if dayLetter == "C" || dayLetter == "3" {
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
                } else if dayLetter == "E" || dayLetter == "5" {
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
                }
                break
            case "ADV": //Advisory
                if (dayLetter == "5" || dayLetter == "E") {
                    if(lunchType == "early") {
                        for index in 0 ... advLunch1Courses.count - 1 {
                            let course = Course(name: advLunch1Courses[index], time: advLunch1Times[index])
                            courses.append(course)
                        }
                    } else if (lunchType == "middle") {
                        for index in 0 ... advLunch2Courses.count - 1 {
                            let course = Course(name: advLunch2Courses[index], time: advLunch2Times[index])
                            courses.append(course)
                        }
                    } else if (lunchType == "late") {
                        for index in 0 ... advLunch3Courses.count - 1 {
                            let course = Course(name: advLunch3Courses[index], time: advLunch3Times[index])
                            courses.append(course)
                        }
                    }
                } else if (dayLetter == "1" || dayLetter == "A") {
                    if (lunchType == "early") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day1Lunch1Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch1Times[index])
                            courses.append(course)
                        }
                    }
                     else if (lunchType == "middle") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day1Lunch2Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch2Times[index])
                            courses.append(course)
                        }
                    } else if (lunchType == "late") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day1Lunch3Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch3Times[index])
                            courses.append(course)
                        }
                    }
                } else if (dayLetter == "2" || dayLetter == "B") {
                    if (lunchType == "early") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day2Lunch1Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch1Times[index])
                            courses.append(course)
                        }
                    }
                    else if (lunchType == "middle") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day2Lunch2Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch2Times[index])
                            courses.append(course)
                        }
                    } else if (lunchType == "late") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day2Lunch3Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch3Times[index])
                            courses.append(course)
                        }
                    }
                } else if (dayLetter == "3" || dayLetter == "C") {
                    if (lunchType == "early") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day3Lunch1Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch1Times[index])
                            courses.append(course)
                        }
                    }
                    else if (lunchType == "middle") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day3Lunch2Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch2Times[index])
                            courses.append(course)
                        }
                    } else if (lunchType == "late") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day3Lunch3Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch3Times[index])
                            courses.append(course)
                        }
                    }
                } else if (dayLetter == "4" || dayLetter == "D") {
                    if (lunchType == "early") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day4Lunch1Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch1Times[index])
                            courses.append(course)
                        }
                    }
                    else if (lunchType == "middle") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day4Lunch2Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch2Times[index])
                            courses.append(course)
                        }
                    } else if (lunchType == "late") {
                        let newAdvisoryCourseNames = addAdvisory(originalCourses: day4Lunch3Courses)
                        for index in 0 ... newAdvisoryCourseNames.count - 1 {
                            let course = Course(name: newAdvisoryCourseNames[index], time: advOtherLunch3Times[index])
                            courses.append(course)
                        }
                    }
                }
                break
            case "CLB": //Collaborative
                for index in 0 ... collabCourses.count - 1 {
                    let course = Course(name: collabCourses[index], time: collabTimes[index])
                    courses.append(course)
                }
                break
            case "1HD": //1 Hour Delay
                var courseNames : [String] = []
                var times : [String] = []
                if (dayLetter == "E" || dayLetter == "5") {
                    if (lunchType == "early") {
                        courseNames = day5Lunch1Courses
                        times = oneHourDelayEarlyLunchTimes
                    } else if lunchType == "middle" {
                        courseNames = day5Lunch2Courses
                        times = oneHourDelayMiddleLunchTimes
                    } else if lunchType == "late" {
                        courseNames = day5Lunch3Courses
                        times = oneHourDelayLateLunchTimes
                    }
                } else {
                    //Handle times: depends on lunch
                    if (lunchType == "early") {
                        times = oneHourDelayEarlyLunchTimes1
                    } else if lunchType == "middle" {
                        times = oneHourDelayMiddleLunchTimes1
                    } else if lunchType == "late" {
                        times = oneHourDelayLateLunchTimes1
                    }
                    //Handle courses: depends on day and lunch
                    if (dayLetter == "1" || dayLetter == "A") {
                        if (lunchType == "early") {
                            courseNames = day1Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day1Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day1Lunch3Courses
                        }
                    } else if (dayLetter == "2" || dayLetter == "B") {
                        if (lunchType == "early") {
                            courseNames = day2Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day2Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day2Lunch3Courses
                        }
                    } else if (dayLetter == "3" || dayLetter == "C") {
                        if (lunchType == "early") {
                            courseNames = day3Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day3Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day3Lunch3Courses
                        }
                    } else if (dayLetter == "4" || dayLetter == "D") {
                        if (lunchType == "early") {
                            courseNames = day4Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day4Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day4Lunch3Courses
                        }
                    }
                    //Load em up!
                    for i in 0 ..< courseNames.count {
                        courses.append(Course(name: courseNames[i],time: times[i]))
                    }
                }
                break
            case "2HD": //2 Hour Delay
                var courseNames : [String] = []
                var times : [String] = []
                if (dayLetter == "E" || dayLetter == "5") {
                    if (lunchType == "early") {
                        courseNames = day5Lunch1Courses
                        times = day5Lunch1Times
                    } else if (lunchType == "middle") {
                        courseNames = day5Lunch2Times
                        times = day5Lunch2Times
                    } else if (lunchType == "late") {
                        courseNames = day5Lunch3Courses
                        times = day5Lunch3Times
                    }
                } else{
                    times = twoHourDelayNormalTimes //Since the periods are the same length as lunch, independent of lunch type
                    if (dayLetter == "1" || dayLetter == "A") {
                        if (lunchType == "early") {
                            courseNames = day1Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day1Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day1Lunch3Courses
                        }
                    } else if (dayLetter == "2" || dayLetter == "B") {
                        if (lunchType == "early") {
                            courseNames = day2Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day2Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day2Lunch3Courses
                        }
                    } else if (dayLetter == "3" || dayLetter == "C") {
                        if (lunchType == "early") {
                            courseNames = day3Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day3Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day3Lunch3Courses
                        }
                    } else if (dayLetter == "4" || dayLetter == "D") {
                        if (lunchType == "early") {
                            courseNames = day4Lunch1Courses
                        } else if (lunchType == "middle") {
                            courseNames = day4Lunch2Courses
                        } else if (lunchType == "late") {
                            courseNames = day4Lunch3Courses
                        }
                    }
                }
                //Load em up!
                for i in 0 ..< courseNames.count {
                    courses.append(Course(name: courseNames[i],time: times[i]))
                }
                break
            default: //SPECIAL
                //Check if the first character of the day type is "~", the notation for a special schedule
                let firstCharIndex = dayType.index(dayType.startIndex, offsetBy: 1)
                if (dayType.substring(to: firstCharIndex) == "~") {
                    //Yay! It is in fact a special schedule.
                    //Let's get this schedule data
                    let scheduleData = config?[dayType + dayLetter] as! Array<String>
                    //Create arrays to store track names and indicies
                    //(A track is a schedule route a student can take. See the README for more details.)
                    var trackNames : [String] = []
                    var trackIndicies : [Int] = []
                    for i in 0 ..< scheduleData.count {
                        let string : String = scheduleData[i]
                        //Check if first character of this string starts with a slash - the notation for a track
                        let firstCharStringIndex = string.index(string.startIndex, offsetBy: 1)
                        if (string.substring(to: firstCharStringIndex) == "/") {
                            //This is the name of a track. Let's add the index and name to the arrays.
                            trackIndicies.append(i)
                            //Cut off the slash
                            let trackName = string.substring(from: firstCharStringIndex) //firstCharStringIndex actually is the second character. from includes index, to excludes index. Search "string substrings" for more information
                            trackNames.append(trackName)
                        }
                    }
                    //Store the track names into the instance variable trackOptions for the SwitchLunchTableViewController
                    self.trackOptions = trackNames
                    if (self.lunchType == nil || self.lunchType == "early" || self.lunchType == "middle" || self.lunchType == "late") {//the user didn't select a particular track. Let's convert it to a number
                        self.lunchType = "0"
                    }
                    //TODO: Change Switch Lunch Button Text.
                    //Change selection into a number for indexing
                    let trackSelection : Int = Int(self.lunchType)!
                    //Update Switch Lunch Button with current track selection
                    SwitchLunchButton.title = trackNames[trackSelection]
                    /*Indices (in scheduleArray)
                     * First Course: trackIndicies[trackIndex] + 1
                     * Last Course Time: trackIndicies[trackIndex + 1] - 1
                     * For more information about layout of schedule information, please visit README
                     * */
                    let fCIndex : Int = trackIndicies[trackSelection] + 1
                    //Index for the where next track starts (with name)
                    var nextTrackNameIndex : Int = 0
                    //To avoid index out of bounds exceptions, let's first check if there are any tracks after this one
                    if (trackSelection == trackIndicies.count - 1) {//It's the last track
                        //Instead, let's have the nextTrackNameIndex be the 1 past the end of the array
                        nextTrackNameIndex = scheduleData.count
                    } else { //It's not the last track
                        nextTrackNameIndex = trackIndicies[trackSelection + 1]
                    }
                    //Instantiate courseNames and times arrays
                    var courseNames : [String] = []
                    var times : [String] = []
                    let trackSize : Int = nextTrackNameIndex - fCIndex
                    if  (trackSize) % 2 == 0 { //Check to make sure there is a time for every course
                        for i in 0..<trackSize { //For each element
                            if (i % 2 == 0) { //The courses and times alternate: even indicies indicate courses
                                courseNames.append(scheduleData[fCIndex + i])
                            } else { //Odd indicies indicate times
                                times.append(scheduleData[fCIndex + i])
                            }
                        }
                    }
                    //Yay! Now let's just add these courseNames and times into the courses array
                    for i in 0..<times.count {
                        courses.append(Course(name: courseNames[i], time: times[i]))
                    }
                }
        }
    }
    
    private func getDay(queryDate: String) {
        //Get Parse Config Data
        PFConfig.getInBackground { (config, error) in
            let dates = config?["WhatDay"] as! Array<String>
            self.config = config!
            //Go through each day item.
            for index in 0 ... (dates.count) - 1 {
                let strIndex = dates[index].index((dates[index].startIndex), offsetBy: 5)
                let subDate = dates[index].substring(to: strIndex)
                //If this particular date matches the queryDate...
                if subDate == queryDate {
                    //Get and set the day code
                    let strDayIndex = dates[index].index((dates[index].startIndex), offsetBy: 6)
                    let lastCharIndex = dates[index].index(dates[index].endIndex, offsetBy: -1)
                    let dayTypeRange = strDayIndex..<lastCharIndex
                    self.dayType = dates[index].substring(with: dayTypeRange) //Could be "", "CLB", "ADV", "1HD", "2HD"
                    //Get letter: used for finding what custom courses we should use...
                    //Always the last characer.
                    self.dayLetter = dates[index].substring(from: lastCharIndex) //Could be A - E, 1 - 5
                    //Get lunch
                    let lunch : String = self.getLunch().lowercased()
                    //Update Switch Lunch Text
                    self.SwitchLunchButton.title = self.getLunch()
                    //Load the courses.
                     self.loadCourses(lunchType: lunch)
                    //Let's display this schedule!
                     self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
    private func getLunch() -> String {
        if (lunchType != nil) {
            //Preselected. Let's follow that. Probably for a selected track for a special schedule
            return lunchType
        } else if (customDays != nil) {
            //Use saved setting on disk
            //Get corresponding index for day type
            let index = ScheduleTableViewController.translateDayToIndex(dayString: dayLetter)
            if (index != -1) {
                //A corresponding day was found.
                return customDays![index].lunchType
            }
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
        //Check if it's a special schedule by seeing if dayType starts with ~
        //TODO:Fix index issue
        if dayType.characters.count > 0 {
            let firstCharIndex = dayType.index(dayType.startIndex, offsetBy: 1)
            if (dayType.substring(to: firstCharIndex) == "~") {
                performSegue(withIdentifier: "switchLunchSegue", sender: dayType)
            }
        } else { //If it's not special, there are only three possible options: "Early","Middle",and "Late"
            performSegue(withIdentifier: "switchLunchSegue", sender: dayLetter)
        }
        
        
    }
    
    public static func loadDays () -> [Day]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Day.ArchiveURL.path) as? [Day]
    }
    
    private func generateDays () -> [Day] {
        //Return a default array of days to serve as baseplate for user customization.
        var days : [Day] = []
        //0 is A, 1 is B, 5 is 1, 6 is 2, 7 is 3....
        for i in 0 ... 9 {
            days.append(generateDay())
        }
        //Save this array of days to disk
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(days, toFile: Day.ArchiveURL.path)
        if isSuccessfulSave {
            print("Successfully saved default schedule data")
        } else {
            print("Unsuccessfully saved default schedule data")
        }
        return days
    }

private func generateDay() -> Day {
    //Generate string array of default course names ... Ex: "Course 1", "Course 2", etc.
    var courses : [String] = []
    for i in 1 ... 8 {
        courses.append("Course " + String(i))
    }
    //Generate default lunch type: Middle
    let lunchType : String = "Middle"
    return Day(courses: courses, lunchType: lunchType)
}

    
    //custom days are stored in array. this function simplifies the process of corresponding the index to the correct day.
    public static func translateDayToIndex(dayString: String) -> Int {
        switch (dayString) {
        case "A":
            return 0
        case "B":
            return 1
        case "C":
            return 2
        case "D":
            return 3
        case "E":
            return 4
        case "1":
            return 5
        case "2":
            return 6
        case "3":
            return 7
        case "4":
            return 8
        case "5":
            return 9
        default:
            //This shouldn't happen
            print("Index did not fit range of A-E or 1-5. Returned -1")
            return -1
        }
    }

private func addAdvisory(originalCourses: [String]) -> [String] {
    //Lunch is already handled
    var coursesWithAdvisory : [String] = []
    for i in 0 ... originalCourses.count{
        if (i < 2) {
            //Before advisory is added. Indicies should match up
            coursesWithAdvisory.append(originalCourses[i])
        } else if (i == 2) {
            //We need to add an advisory here.
            coursesWithAdvisory.append("Advisory")
        } else {
            //We are one index ahead
            coursesWithAdvisory.append(originalCourses[i - 1])
        }
    }
    return coursesWithAdvisory
}
    
}
