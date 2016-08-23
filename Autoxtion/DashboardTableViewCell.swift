//
//  DashboardTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 09/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    @IBOutlet weak var dashboardCustomerName: UILabel!
    @IBOutlet weak var dashboardLogin: UILabel!
    @IBOutlet weak var dashboardCustomerEmail: UILabel!
    @IBOutlet weak var dashboardLine: UIView!
    @IBOutlet weak var dashboardLineImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
