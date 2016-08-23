//
//  FeedbackTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 28/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {
    @IBOutlet weak var feedbackCustomerName: UILabel!
    @IBOutlet weak var feedbackDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
