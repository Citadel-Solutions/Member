//
//  GenerateCustomerCredentialViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 10/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var generateCredentialFlag = "0"

class GenerateCustomerCredentialViewController: UIViewController {
    @IBOutlet weak var existingCustomerDetailView: UIView!
    @IBOutlet weak var existingCustomerNameVuew: UIView!
    @IBOutlet weak var existingCustomerEmailView: UIView!
    @IBOutlet weak var existingCustomerPhoneNumberView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GenerateCustomerCredentialViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderCustomerInfoView = CALayer()
        bottomBorderCustomerInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderCustomerInfoView.frame = CGRectMake(0.0, self.existingCustomerDetailView.frame.size.height-1, 800, 1.0)
        bottomBorderCustomerInfoView.backgroundColor = buttonColor.CGColor
        self.existingCustomerDetailView.layer .addSublayer(bottomBorderCustomerInfoView)
        
        let topBorderCustomerInfoView = CALayer()
        topBorderCustomerInfoView.backgroundColor = buttonColor.CGColor
        topBorderCustomerInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.existingCustomerDetailView.layer .addSublayer(topBorderCustomerInfoView)
        
        //bottom border to Register First Name
        let bottomBorderCustomerName = CALayer()
        bottomBorderCustomerName.borderColor = UIColor.grayColor().CGColor
        bottomBorderCustomerName.frame = CGRectMake(0.0, self.existingCustomerNameVuew.frame.size.height-1, 800, 1.0)
        bottomBorderCustomerName.backgroundColor = buttonColor1.CGColor
        self.existingCustomerNameVuew.layer .addSublayer(bottomBorderCustomerName)
        
        //bottom border to Register Last Name
        let bottomBorderCustomerEmail = CALayer()
        bottomBorderCustomerEmail.borderColor = UIColor.grayColor().CGColor
        bottomBorderCustomerEmail.frame = CGRectMake(0.0, self.existingCustomerEmailView.frame.size.height-1, 800, 1.0)
        bottomBorderCustomerEmail.backgroundColor = buttonColor1.CGColor
        self.existingCustomerEmailView.layer .addSublayer(bottomBorderCustomerEmail)
        
        //bottom border to Register Phone Number
        let bottomBorderCustomerPhone = CALayer()
        bottomBorderCustomerPhone.borderColor = UIColor.grayColor().CGColor
        bottomBorderCustomerPhone.frame = CGRectMake(0.0, self.existingCustomerPhoneNumberView.frame.size.height-1, 800, 1.0)
        bottomBorderCustomerPhone.backgroundColor = buttonColor1.CGColor
        self.existingCustomerPhoneNumberView.layer .addSublayer(bottomBorderCustomerPhone)
        
        let topBorderCustomerPhoneView = CALayer()
        topBorderCustomerPhoneView.backgroundColor = buttonColor.CGColor
        topBorderCustomerPhoneView.frame = CGRectMake(0, 0, 800, 1)
        self.existingCustomerPhoneNumberView.layer .addSublayer(topBorderCustomerPhoneView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateCredentialDoneTapped(sender: AnyObject) {
        generateCredentialFlag = "1"
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
