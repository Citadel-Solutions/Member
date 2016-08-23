//
//  LeadTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 27/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class LeadTableViewCell: UITableViewCell {
    @IBOutlet weak var leadNameTable: UILabel!
    @IBOutlet weak var leadEmailTable: UILabel!
    @IBOutlet weak var leadMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
