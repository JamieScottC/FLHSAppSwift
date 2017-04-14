//
//  CalendarViewController.swift
//  FLHS_App
//
//  Created by Drew Gregory on 4/12/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet var CalendarWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hide Header. Prevents UI from autoscalling the header.
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        //ALT Print URL"http://www.bcsdny.org/calendar_events.cfm?&cat=0&location=1&themonth=4&theyear=2017&buildit=0.316616187762&AddSportingEvents=0&printPage=1"
        let requestURL = NSURL(string: "http://www.bcsdny.org/m/events.cfm")
        let request = NSURLRequest(url: requestURL as! URL)
        CalendarWebView.loadRequest(request as URLRequest)
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

}
