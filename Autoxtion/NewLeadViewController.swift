//
//  NewLeadViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 10/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class NewLeadViewController: UIViewController {
    @IBOutlet weak var newLeadPersonalView: UIView!
    @IBOutlet weak var newLeadVehicleView: UIView!
    @IBOutlet weak var newLeadNameView: UIView!
    @IBOutlet weak var newLeadAddressView: UIView!
    @IBOutlet weak var newLeadLicenseView: UIView!
    @IBOutlet weak var newLeadEmailView: UIView!
    @IBOutlet weak var newLeadPhoneView: UIView!
    @IBOutlet weak var newLeadRegistrationNumberView: UIView!
    @IBOutlet weak var registrationExpiryDate: UITextField!
    @IBOutlet weak var registrationExpiryDateView: UIView!
    @IBOutlet weak var selectVehicleDetailsView: UIStackView!
    @IBOutlet weak var selectVehicleModelView: UIStackView!
    @IBOutlet weak var selectVehicleYearView: UIStackView!
    @IBOutlet weak var selectVehicleBrandButton: UIButton!
    @IBOutlet weak var selectVehicleModelButton: UIButton!
    @IBOutlet weak var selectVehicleYearButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //tap to dismiss keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewLeadViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        if newLeadClicked == "yes" {
            self.selectVehicleBrandButton.setTitle("Select Vehicle Brand", forState: .Normal)
            self.selectVehicleModelButton.setTitle("Select Vehicle Model", forState: .Normal)
            self.selectVehicleYearButton.setTitle("Select Vehicle Make Year", forState: .Normal)
        }
        else {
            self.selectVehicleBrandButton.setTitle(vehicleBrandSelected, forState: .Normal)
            self.selectVehicleBrandButton.setTitle(vehicleModelSelected, forState: .Normal)
            self.selectVehicleBrandButton.setTitle(vehicleYearSelected, forState: .Normal)
        }
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderPersonalInfoView = CALayer()
        bottomBorderPersonalInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPersonalInfoView.frame = CGRectMake(0.0, self.newLeadPersonalView.frame.size.height-1, 800, 1.0)
        bottomBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        self.newLeadPersonalView.layer .addSublayer(bottomBorderPersonalInfoView)
        
        let topBorderPersonalInfoView = CALayer()
        topBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        topBorderPersonalInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.newLeadPersonalView.layer .addSublayer(topBorderPersonalInfoView)
        
        let topBorderPrivateInfoView = CALayer()
        topBorderPrivateInfoView.backgroundColor = buttonColor.CGColor
        topBorderPrivateInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.newLeadVehicleView.layer .addSublayer(topBorderPrivateInfoView)
        
        let bottomBorderPrivateInfoView = CALayer()
        bottomBorderPrivateInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPrivateInfoView.frame = CGRectMake(0.0, self.newLeadVehicleView.frame.size.height-1, 800, 1.0)
        bottomBorderPrivateInfoView.backgroundColor = buttonColor.CGColor
        self.newLeadVehicleView.layer .addSublayer(bottomBorderPrivateInfoView)
        
        let bottomBorderRegisterFirstName = CALayer()
        bottomBorderRegisterFirstName.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterFirstName.frame = CGRectMake(0.0, self.newLeadNameView.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterFirstName.backgroundColor = buttonColor1.CGColor
        self.newLeadNameView.layer .addSublayer(bottomBorderRegisterFirstName)
        
        //bottom border to Register Last Name
        let bottomBorderRegisterLastName = CALayer()
        bottomBorderRegisterLastName.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterLastName.frame = CGRectMake(0.0, self.newLeadAddressView.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterLastName.backgroundColor = buttonColor1.CGColor
        self.newLeadAddressView.layer .addSublayer(bottomBorderRegisterLastName)
        
        //bottom border to Register Phone Number
        let bottomBorderRegisterPhone = CALayer()
        bottomBorderRegisterPhone.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterPhone.frame = CGRectMake(0.0, self.newLeadLicenseView.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterPhone.backgroundColor = buttonColor1.CGColor
        self.newLeadLicenseView.layer .addSublayer(bottomBorderRegisterPhone)
        
        let bottomBorderRegisterPasswrd = CALayer()
        bottomBorderRegisterPasswrd.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterPasswrd.frame = CGRectMake(0.0, self.newLeadEmailView.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterPasswrd.backgroundColor = buttonColor1.CGColor
        self.newLeadEmailView.layer .addSublayer(bottomBorderRegisterPasswrd)
        
        //bottom border to Register Confirm Password
        let bottomBorderRegisterConfirmPassword = CALayer()
        bottomBorderRegisterConfirmPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterConfirmPassword.frame = CGRectMake(0.0, self.newLeadRegistrationNumberView.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterConfirmPassword.backgroundColor = buttonColor1.CGColor
        self.newLeadRegistrationNumberView.layer .addSublayer(bottomBorderRegisterConfirmPassword)
  
        let bottomBorderRegistrationExpiryDate = CALayer()
        bottomBorderRegistrationExpiryDate.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegistrationExpiryDate.frame = CGRectMake(0.0, self.registrationExpiryDateView.frame.size.height-1, 800, 1.0)
        bottomBorderRegistrationExpiryDate.backgroundColor = buttonColor1.CGColor
        self.registrationExpiryDateView.layer .addSublayer(bottomBorderRegistrationExpiryDate)
        
        let bottomBorderSelectVehicleDetails = CALayer()
        bottomBorderSelectVehicleDetails.borderColor = UIColor.grayColor().CGColor
        bottomBorderSelectVehicleDetails.frame = CGRectMake(0.0, self.selectVehicleDetailsView.frame.size.height-1, 800, 1.0)
        bottomBorderSelectVehicleDetails.backgroundColor = buttonColor1.CGColor
        self.selectVehicleDetailsView.layer .addSublayer(bottomBorderSelectVehicleDetails)
        
        let bottomBorderSelectVehicleModel = CALayer()
        bottomBorderSelectVehicleModel.borderColor = UIColor.grayColor().CGColor
        bottomBorderSelectVehicleModel.frame = CGRectMake(0.0, self.selectVehicleModelView.frame.size.height-1, 800, 1.0)
        bottomBorderSelectVehicleModel.backgroundColor = buttonColor1.CGColor
        self.selectVehicleModelView.layer .addSublayer(bottomBorderSelectVehicleModel)
        
        let bottomBorderSelectVehicleYear = CALayer()
        bottomBorderSelectVehicleYear.borderColor = UIColor.grayColor().CGColor
        bottomBorderSelectVehicleYear.frame = CGRectMake(0.0, self.selectVehicleYearView.frame.size.height-1, 800, 1.0)
        bottomBorderSelectVehicleYear.backgroundColor = buttonColor.CGColor
        self.selectVehicleYearView.layer .addSublayer(bottomBorderSelectVehicleYear)
        
//*********************************************************************************************************************
        //on date select, show toolbar
        let toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        
        let toolbarColor = UIColor(red: 68/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.BlackTranslucent
        
        toolBar.tintColor = UIColor.whiteColor()
        
        toolBar.backgroundColor = buttonColor
        
        
        let todayBtn = UIBarButtonItem(title: "Today", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(NewLeadViewController.tappedToolBarBtn))
        
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(NewLeadViewController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clearColor()
        
        label.textColor = toolbarColor
        
        label.text = "Select Registration Expiry Date"
        
        label.textAlignment = NSTextAlignment.Center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([todayBtn,flexSpace,textBtn,flexSpace,okBarBtn], animated: true)
        
        registrationExpiryDate.inputAccessoryView = toolBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//*********************************************************************************************************************
    func donePressed(sender: UIBarButtonItem) {
        registrationExpiryDate.resignFirstResponder()
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateformatter.timeStyle = NSDateFormatterStyle.NoStyle
        registrationExpiryDate.text = dateformatter.stringFromDate(NSDate())
        registrationExpiryDate.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

//*********************************************************************************************************************
    @IBAction func registrationExpiryDateEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(NewLeadViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        registrationExpiryDate.text = dateFormatter.stringFromDate(sender.date)
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
