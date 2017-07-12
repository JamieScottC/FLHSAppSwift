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

class DatePickerViewController : UIViewController {
    @IBOutlet var DatePicker: UIDatePicker!
    @IBOutlet var DateButton: UIButton!
    
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
        var dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        var strDate = dateFormatter.string(from: DatePicker.date)
        print (strDate);
    }
}
