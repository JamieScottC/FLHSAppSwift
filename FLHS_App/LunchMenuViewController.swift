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
    
    @IBOutlet weak var lunchMenuWebView: UIWebView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        //let date = Date()
        //let formatter = DateFormatter()
        //formatter.dateFormat = "MM"
        
        
        let url = "http://www.bcsdny.org/files/filesystem/April%20HS%20MS%20Lunch%20.pdf"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(url: requestURL! as URL)
        lunchMenuWebView.loadRequest(request as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

