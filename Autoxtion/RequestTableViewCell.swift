//
//  RequestTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 27/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {
    @IBOutlet weak var requestCustomerName: UILabel!
    @IBOutlet weak var requestServiceType: UILabel!
    @IBOutlet weak var requestCouponCode: UILabel!
    @IBOutlet weak var requestScheduleAppointment: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
