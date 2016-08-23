//
//  PromotionTableViewCell.swift
//  Autoxtion
//
//  Created by citadel soluions on 27/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {
    @IBOutlet weak var promotionServiceType: UILabel!
    @IBOutlet weak var promotionVehicleModel: UILabel!
    @IBOutlet weak var promotionVehicleMfdYear: UILabel!
    @IBOutlet weak var promotionCouponCode: UILabel!
    @IBOutlet weak var promotionImageView: UIView!
    @IBOutlet weak var promotionImage: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
