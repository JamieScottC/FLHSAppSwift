//
//  ScheduleTableViewCell.swift
//  FLHS_App
//
//  Created by Drew Gregory on 4/12/17.
//  Copyright © 2017 FLHS Computer Science Club. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet var courseName: UILabel!
    @IBOutlet var courseTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
