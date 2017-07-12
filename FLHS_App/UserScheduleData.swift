//
//  UserScheduleData.swift
//  FLHS_App
//
//  Created by Drew Gregory on 7/11/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import Foundation
import os.log
class UserScheduleData : NSObject, NSCoding{
    
    //TODO: Add variables and find way to store custom course names.
    var queryDate: String
    
    struct SchedulePropertyKey {
        static let queryDate = "queryDate"
        //TODO: Make a new class to store custom course information.
        static let course1 = "course1"
        static let course2 = "course2"
        static let course3 = "course3"
        static let course4 = "course4"
        static let course5 = "course5"
        static let course6 = "course6"
        static let course7 = "course7"
        static let course8 = "course8"
        static let dayA = "A"
        static let dayB = "B"
        static let dayC = "C"
        static let dayD = "D"
        static let dayE = "E"
        static let day1 = "1"
        static let day2 = "2"
        static let day3 = "3"
        static let day4 = "4"
        static let day5 = "5"
        
    }
    
    init(queryDate: String) {
        self.queryDate = queryDate;
    }
    
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(queryDate, forKey: SchedulePropertyKey.queryDate)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The queryDate is required. If we cannot decode a name string, the initializer should fail.
        guard let queryDate = aDecoder.decodeObject(forKey: SchedulePropertyKey.queryDate) as? String
        else {
            os_log("Unable to decode the query date: let me set the query date to today...", log: OSLog.default, type: .debug)
            return nil;
        }
        self.init(queryDate: queryDate);
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("FLHSdata")



}
