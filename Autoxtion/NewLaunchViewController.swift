//
//  NewLaunchViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 04/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class NewLaunchViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var subscriptionPlanButton: UIButton!
    @IBOutlet weak var launchButtonView: UIView!
    @IBOutlet weak var launchButtonStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subscriptionPlanButtonColor = UIColor(red: 219.0/255.0, green: 219.0/255.0, blue: 219.0/255.0, alpha: 1.0)
        // top border to subscription & Sign Up Button
        let topBorderSubscription = CALayer()
        topBorderSubscription.backgroundColor = subscriptionPlanButtonColor.CGColor
        topBorderSubscription.frame = CGRectMake(0, 0, 800, 1)
        self.subscriptionPlanButton.layer .addSublayer(topBorderSubscription)
        
        let topBorderSignup = CALayer()
        topBorderSignup.backgroundColor = subscriptionPlanButtonColor.CGColor
        topBorderSignup.frame = CGRectMake(0, 0, self.signUpButton.frame.size.width, 1)
        self.signUpButton.layer .addSublayer(topBorderSignup)
        
        //left border to subscription & Sign Up Button
        let leftBorderSignup = CALayer()
        leftBorderSignup.backgroundColor = subscriptionPlanButtonColor.CGColor
        leftBorderSignup.frame = CGRectMake(0, 0, 1, self.signUpButton.frame.size.width)
        self.signUpButton.layer .addSublayer(leftBorderSignup)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
