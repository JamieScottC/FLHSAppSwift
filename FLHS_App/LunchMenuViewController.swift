//
//  LunchMenuViewController.swift
//  FLHS_App
//
//  Created by Brian Poor on 4/14/17
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import Foundation
import UIKit

class LunchMenuViewController: UIViewController{
    
    //View Controller for the lunch menu
    @IBOutlet weak var lunchMenuWebView: UIWebView!
    
    //Month retrival = MM string form --> Int (Array index) --> Month (Array Value)
    var monthArray = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    //Load URL and UIViewController
    override func viewDidLoad(){
        //Standard load
        super.viewDidLoad()
        
        //Retrives date from phone
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let monthNumStr = formatter.string(from: date)
        var monthIndex = Int(monthNumStr)!
        monthIndex = monthIndex - 1
        let monthStr = monthArray[monthIndex]
        
        
        //Creates Lunch Menu URL
        let url = "http://www.bcsdny.org/files/filesystem/" + monthStr + "%20HS%20MS%20Lunch%20.pdf"
        
        //Initialize lunchMenuWebView to display URL
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(url: requestURL! as URL)
        lunchMenuWebView.loadRequest(request as URLRequest)
    }
    
    //Memory Exception Handling ew
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

