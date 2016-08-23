//
//  VehicleYearTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 11/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class VehicleYearTableViewCell: UITableViewCell {
    @IBOutlet weak var vehicleYear: UILabel!
    @IBOutlet weak var vehicleYearPromotion: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
