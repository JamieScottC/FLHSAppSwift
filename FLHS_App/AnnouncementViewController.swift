//
//  AnnouncementViewController.swift
//  FLHS_App
//
//  Created by Brian Poor on 4/14/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import Foundation
import UIKit

class AnnouncementViewController: UIViewController{
    
    @IBOutlet weak var announcementWebView: UIWebView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        let url = "http://www.bcsdny.org/m/content.cfm?subpage=1841"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(url: requestURL! as URL)
        announcementWebView.loadRequest(request as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

