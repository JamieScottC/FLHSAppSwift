//
//  SwitchLunchControllerViewController.swift
//  FLHS_App
//
//  Created by Drew Gregory on 7/12/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit

class SwitchLunchTableViewController: UITableViewController  {

    var items : [String] = ["Early", "Middle", "Late"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
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
    
    
    //MARK: TableView stuffs. Used to inflat mutable list of schedule types (almost always early, middle, or late, but sometimes for special days we can have different schedule types [assembly track a, assembly track b, etc.])
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Item selected!" + self.items[indexPath.row])
        //Display schedule with updated lunch selection.
        performSegue(withIdentifier: "DisplayScheduleLunchSegue", sender: self.items[indexPath.row])

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DisplayScheduleLunchSegue" {
            let schedTableVC = segue.destination as! ScheduleTableViewController
            let lunch =  sender as! String
            schedTableVC.lunchType = lunch
        }
    }
   
    //MARK: Persisting lunch data.
    //TODO: Work on persisting lunch data.

    
    
    }
