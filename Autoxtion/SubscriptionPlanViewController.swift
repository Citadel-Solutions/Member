//
//  SubscriptionPlanViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 17/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class SubscriptionPlanViewController: UIViewController {
    @IBOutlet weak var monthlySeviceFeeView: UIView!
    @IBOutlet weak var premiumServiceView: UIView!
    @IBOutlet weak var ourPremiumServicesView: UIView!
    @IBOutlet weak var noteText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let buttonColor = UIColor(red: 243/255.0, green: 134/255.0, blue: 25/255.0, alpha: 1.0)
        let bottomBorderColorDark = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
      
        self.monthlySeviceFeeView.layer.borderWidth = 1
        self.monthlySeviceFeeView.layer.cornerRadius = 40
        self.monthlySeviceFeeView.layer.borderColor = buttonColor.CGColor
        
        let topBorderourOurPremiumServices = CALayer()
        topBorderourOurPremiumServices.backgroundColor = bottomBorderColorDark.CGColor
        topBorderourOurPremiumServices.frame = CGRectMake(-20.0, 0, 800, 1)
        self.ourPremiumServicesView.layer .addSublayer(topBorderourOurPremiumServices)
        
        let bottomBorderOurPremiumServices = CALayer()
        bottomBorderOurPremiumServices.borderColor = UIColor.grayColor().CGColor
        bottomBorderOurPremiumServices.frame = CGRectMake(0.0, self.ourPremiumServicesView.frame.size.height-1, 800, 1.0)
        bottomBorderOurPremiumServices.backgroundColor = bottomBorderColorDark.CGColor
        self.ourPremiumServicesView.layer .addSublayer(bottomBorderOurPremiumServices)
        
        let bottomBorderPremiumService = CALayer()
        bottomBorderPremiumService.borderColor = UIColor.grayColor().CGColor
        bottomBorderPremiumService.frame = CGRectMake(0.0, self.premiumServiceView.frame.size.height-1, 800, 1.0)
        bottomBorderPremiumService.backgroundColor = buttonColor.CGColor
        self.premiumServiceView.layer .addSublayer(bottomBorderPremiumService)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func aboutAutoxtionPrivacyTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://portal.autoxtion.com.au/registration/usermanual/")!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
