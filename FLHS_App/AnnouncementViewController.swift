//
//  AnnouncementViewController.swift
//  FLHS_App
//
//  Created by Brian Poor on 4/14/17
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import Foundation
import UIKit

class AnnouncementViewController: UIViewController{
    
    //Announcement UIWebViewController
    @IBOutlet weak var announcementWebView: UIWebView!
    
    //Load UIWebView
    override func viewDidLoad(){
        //Standard Load
        super.viewDidLoad()
        //Hides Header of webpage behind navigation.
        self.automaticallyAdjustsScrollViewInsets = false
        
        //Initialize UIWebview with announcement URL
        let url = "https://www.bcsdny.org/domain/154"//Announcement URL
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(url: requestURL! as URL)
        announcementWebView.loadRequest(request as URLRequest)
    }

    //Memory Exception Handling
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

