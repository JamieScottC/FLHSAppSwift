//
//  Day.swift
//  FLHS_App
//
//  Created by Drew Gregory on 7/12/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import Foundation
class Day : NSObject, NSCoding{
    //Data Structure for persisting custom schedule data.
    
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("FLHSdata")
    

    var courses : [String]
    var lunchType : String
    
    struct SchedulePropertyKey {
        static let lunchType = "lunchType"
        static let courses = "courses"
    }
    
    
    init (courses: [String], lunchType: String) {
        self.courses = courses
        self.lunchType = lunchType
    }
    
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(lunchType, forKey: SchedulePropertyKey.lunchType)
        aCoder.encode(courses, forKey: SchedulePropertyKey.courses)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The days are required. If we cannot decode a name string, the initializer should fail.
        guard let courses = aDecoder.decodeObject(forKey: SchedulePropertyKey.courses) as? [String]
            else {
               print("Unable to decode the course names")
                return nil
        }
        //The lunch type is also required. If we cannot decode a lunch type, the initializer should fail.
        guard let lunchType = aDecoder.decodeObject(forKey: SchedulePropertyKey.lunchType) as? String
            else{
            print("Unable to decode lunchType")
                return nil
        }
        self.init(courses: courses, lunchType: lunchType)
    }

}
