//
//  VehicleBrandsTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 11/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class VehicleBrandsTableViewCell: UITableViewCell {
    @IBOutlet weak var vehicleBrand: UILabel!

    @IBOutlet weak var vehicleBrandPromotion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
