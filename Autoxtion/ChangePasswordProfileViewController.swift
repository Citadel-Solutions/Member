//
//  ChangePasswordProfileViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 28/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class ChangePasswordProfileViewController: UIViewController {
    @IBOutlet weak var currentPasswordText: UITextField!
    @IBOutlet weak var newPasswordText: UITextField!
    @IBOutlet weak var reConfirmPasswordText: UITextField!
    
    @IBOutlet weak var currentPasswordView: UIView!
    @IBOutlet weak var NewPasswordView: UIView!
    @IBOutlet weak var reConfirmPasswordView: UIView!
    @IBOutlet weak var newPasswordImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderCurrentPassword = CALayer()
        bottomBorderCurrentPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderCurrentPassword.frame = CGRectMake(0.0, self.currentPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderCurrentPassword.backgroundColor = buttonColor.CGColor
        self.currentPasswordView.layer .addSublayer(bottomBorderCurrentPassword)
        
        let topBorderCurrentPassword = CALayer()
        topBorderCurrentPassword.backgroundColor = buttonColor.CGColor
        topBorderCurrentPassword.frame = CGRectMake(0, 0, 800, 1)
        self.currentPasswordView.layer .addSublayer(topBorderCurrentPassword)
        
        let bottomBorderReconfirmPassword = CALayer()
        bottomBorderReconfirmPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderReconfirmPassword.frame = CGRectMake(0.0, self.reConfirmPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderReconfirmPassword.backgroundColor = buttonColor.CGColor
        self.reConfirmPasswordView.layer .addSublayer(bottomBorderReconfirmPassword)
        
        let topBorderNewPassword = CALayer()
        topBorderNewPassword.backgroundColor = buttonColor.CGColor
        topBorderNewPassword.frame = CGRectMake(0, 0, 800, 1)
        self.NewPasswordView.layer .addSublayer(topBorderNewPassword)
        
        let bottomBorderNewPassword = CALayer()
        bottomBorderNewPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderNewPassword.frame = CGRectMake(25.0, self.NewPasswordView.frame.size.height-1, 800, 1.0)
        bottomBorderNewPassword.backgroundColor = buttonColor1.CGColor
        self.NewPasswordView.layer .addSublayer(bottomBorderNewPassword)
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
