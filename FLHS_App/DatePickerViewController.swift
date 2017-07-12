//
//  DatePickerViewController.swift
//  FLHS_App
//
//  Created by Drew Gregory on 7/11/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import Foundation
import UIKit
import os.log

//Found code to simplify index of process (SRC:https://stackoverflow.com/questions/32305891/index-of-a-substring-in-a-string-with-swift)
extension String {
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: String, options: CompareOptions = .literal) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
}

class DatePickerViewController : UIViewController {

    
    
    @IBOutlet var DatePicker: UIDatePicker!
    @IBAction func saveQueryDate(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        //Get selectedDate from DatePicker
        let dateString = dateFormatter.string(from: DatePicker.date)
        //The dates are stored in Parse as 'MM/DD'. We need to convert the string to this format.
        //Get Month
        let monthAndDateIndexes = dateString.indexes(of: "/")
        let monthIndex = monthAndDateIndexes[0]
        var monthSubString = dateString.substring(to: monthIndex)
        //If the month is only a single digit, we need to append a 0.
        if monthSubString.characters.count == 1 {
            monthSubString = "0" + monthSubString
        }
        let dateEndIndex = monthAndDateIndexes[1]
        let dateStartIndex = dateString.index(monthIndex, offsetBy: 1) //The date begins just after the first slash
        let range = dateStartIndex..<dateEndIndex
        var dateSubString = dateString.substring(with: range)
        //If the date is only a single digit, we need to append a 0.
        if dateSubString.characters.count == 1 {
            dateSubString = "0" + dateSubString
        }
        //Now just put em together!
        let queryDate = monthSubString + "/" + dateSubString
        performSegue(withIdentifier: "displayScheduleSegue", sender: queryDate)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //DatePicker.addTarget(self, action: "datePickerChanged", for: UIControlEvents.valueChanged)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func datePickerChanged() { //datePicker:UIDatePicker
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayScheduleSegue" {
            let schedTableVC = segue.destination as! ScheduleTableViewController
            let queryString =  sender as! String
            schedTableVC.queryDate = queryString
        }
    }
}
