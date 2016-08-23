//
//  LoginViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 25/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var loginFlag = "0"

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailLoginView: UIView!
    @IBOutlet weak var forgotPasswordLoginView: UIView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
         //top border to forgot password
        let topBorderForgotPasswordLoginView = CALayer()
        topBorderForgotPasswordLoginView.backgroundColor = buttonColor.CGColor
        topBorderForgotPasswordLoginView.frame = CGRectMake(-20.0, 0, 800, 1)
        self.forgotPasswordLoginView.layer .addSublayer(topBorderForgotPasswordLoginView)
        
        //bottom border to login email
        let bottomBorderLoginEmail = CALayer()
        bottomBorderLoginEmail.borderColor = UIColor.grayColor().CGColor
        bottomBorderLoginEmail.frame = CGRectMake(0.0, self.emailTextField.frame.size.height-1, 800, 1.0)
        bottomBorderLoginEmail.backgroundColor = buttonColor1.CGColor
        self.emailTextField.layer .addSublayer(bottomBorderLoginEmail)
        
        //bottom border to login Password
        let bottomBorderPassword = CALayer()
        bottomBorderPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderPassword.frame = CGRectMake(0.0, self.passwordTextField.frame.size.height-1, 800, 1.0)
        bottomBorderPassword.backgroundColor = buttonColor1.CGColor
        self.passwordTextField.layer .addSublayer(bottomBorderPassword)
        
        //border to login button
        let loginbuttonColor = UIColor(red: 243.0/255.0, green: 134.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        self.loginButton.layer.borderWidth = 1
        self.loginButton.layer.borderColor = loginbuttonColor.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
