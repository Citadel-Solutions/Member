//
//  RegisterViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 25/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var paymentFlag = "0"

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var countryCityPicker: UIPickerView!
    //Registration Fields
    @IBOutlet weak var firstNameRegister: UITextField!
    @IBOutlet weak var lastNameRegister: UITextField!
    @IBOutlet weak var phoneNumberRegister: UITextField!
    @IBOutlet weak var emailRegister: UITextField!
    @IBOutlet weak var passwordRegister: UITextField!
    @IBOutlet weak var confirmPasswordRegister: UITextField!
    @IBOutlet weak var shopNameRegister: UITextField!
    @IBOutlet weak var shopAddressRegister: UITextField!
    @IBOutlet weak var websiteRegister: UITextField!
    @IBOutlet weak var abnRegister: UITextField!
    @IBOutlet weak var personalInfoView: UIView!
    @IBOutlet weak var privateInfoView: UIView!
    @IBOutlet weak var shopInfoView: UIView!
    @IBOutlet weak var shopNameBottomConstraint: NSLayoutConstraint!
    
    var year: Int = 0
    var arrayCount: Int = 0
    var arraystring: String = ""
    var cityArray: [[String]] = [["Select Country", "Australia"], ["Select City", "Melbourne", "Sydney", "Canberra", "Adelaide", "Maryborough", "Bairnsdale", "Bendigo"]]
    //declare array to display picker(for year in payment)
    var yearArray = [String]()
    //declare array to display picker(for month and year in payment)
    var paymentArray: [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tap to dismiss keyboard
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RegisterViewController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RegisterViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
 //**********************************************************************************************
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        //top borders to views
        let topBorderPersonalInfoView = CALayer()
        topBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        topBorderPersonalInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.personalInfoView.layer .addSublayer(topBorderPersonalInfoView)
        
        let topBorderPrivateInfoView = CALayer()
        topBorderPrivateInfoView.backgroundColor = buttonColor.CGColor
        topBorderPrivateInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.privateInfoView.layer .addSublayer(topBorderPrivateInfoView)
        
        let topBorderShopInfoView = CALayer()
        topBorderShopInfoView.backgroundColor = buttonColor.CGColor
        topBorderShopInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.shopInfoView.layer .addSublayer(topBorderShopInfoView)
        
        //bottom borders to views
        let bottomBorderPersonalInfoView = CALayer()
        bottomBorderPersonalInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPersonalInfoView.frame = CGRectMake(0.0, self.personalInfoView.frame.size.height-1, 800, 1.0)
        bottomBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        self.personalInfoView.layer .addSublayer(bottomBorderPersonalInfoView)
        
        let bottomBorderPrivateInfoView = CALayer()
        bottomBorderPrivateInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPrivateInfoView.frame = CGRectMake(0.0, self.privateInfoView.frame.size.height-1, 800, 1.0)
        bottomBorderPrivateInfoView.backgroundColor = buttonColor.CGColor
        self.privateInfoView.layer .addSublayer(bottomBorderPrivateInfoView)
        
        let bottomBorderShopInfoView = CALayer()
        bottomBorderShopInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderShopInfoView.frame = CGRectMake(0.0, self.shopInfoView.frame.size.height-1, 800, 1.0)
        bottomBorderShopInfoView.backgroundColor = buttonColor.CGColor
        self.shopInfoView.layer .addSublayer(bottomBorderShopInfoView)
        
        let bottomBorderRegisterFirstName = CALayer()
        bottomBorderRegisterFirstName.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterFirstName.frame = CGRectMake(0.0, self.firstNameRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterFirstName.backgroundColor = buttonColor1.CGColor
        self.firstNameRegister.layer .addSublayer(bottomBorderRegisterFirstName)
        
        let bottomBorderRegisterLastName = CALayer()
        bottomBorderRegisterLastName.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterLastName.frame = CGRectMake(0.0, self.lastNameRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterLastName.backgroundColor = buttonColor1.CGColor
        self.lastNameRegister.layer .addSublayer(bottomBorderRegisterLastName)
        
        let bottomBorderRegisterPhone = CALayer()
        bottomBorderRegisterPhone.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterPhone.frame = CGRectMake(0.0, self.phoneNumberRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterPhone.backgroundColor = buttonColor1.CGColor
        self.phoneNumberRegister.layer .addSublayer(bottomBorderRegisterPhone)
        
        let bottomBorderRegisterPasswrd = CALayer()
        bottomBorderRegisterPasswrd.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterPasswrd.frame = CGRectMake(0.0, self.passwordRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterPasswrd.backgroundColor = buttonColor1.CGColor
        self.passwordRegister.layer .addSublayer(bottomBorderRegisterPasswrd)

        let bottomBorderRegisterConfirmPassword = CALayer()
        bottomBorderRegisterConfirmPassword.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterConfirmPassword.frame = CGRectMake(0.0, self.confirmPasswordRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterConfirmPassword.backgroundColor = buttonColor1.CGColor
        self.confirmPasswordRegister.layer .addSublayer(bottomBorderRegisterConfirmPassword)
        
        let bottomBorderRegisterShopName = CALayer()
        bottomBorderRegisterShopName.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterShopName.frame = CGRectMake(0.0, self.shopNameRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterShopName.backgroundColor = buttonColor1.CGColor
        self.shopNameRegister.layer .addSublayer(bottomBorderRegisterShopName)
        
        let bottomBorderRegisterShopAddress = CALayer()
        bottomBorderRegisterShopAddress.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterShopAddress.frame = CGRectMake(0.0, self.shopAddressRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterShopAddress.backgroundColor = buttonColor1.CGColor
        self.shopAddressRegister.layer .addSublayer(bottomBorderRegisterShopAddress)
        
        let bottomBorderRegisterWebsite = CALayer()
        bottomBorderRegisterWebsite.borderColor = UIColor.grayColor().CGColor
        bottomBorderRegisterWebsite.frame = CGRectMake(0.0, self.websiteRegister.frame.size.height-1, 800, 1.0)
        bottomBorderRegisterWebsite.backgroundColor = buttonColor1.CGColor
        self.websiteRegister.layer .addSublayer(bottomBorderRegisterWebsite)
        
        //current date
//        let date = NSDate()
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
//        
//        year =  components.year
//        _ = components.month
//        _ = components.day
//        
//        for j in 0..<20
//        {
//            yearArray.append(String(year+j))
//            print(yearArray[j])
//        }
//        
//        paymentArray = [["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], [yearArray[0], yearArray[1], yearArray[2], yearArray[3], yearArray[4], yearArray[5], yearArray[6], yearArray[7], yearArray[8], yearArray[9], yearArray[10], yearArray[11], yearArray[12], yearArray[13], yearArray[14], yearArray[15], yearArray[16], yearArray[17], yearArray[18], yearArray[19]]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //function for number of components in pickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        print(cityArray.count)
        return cityArray.count
    }
    
    //function for the number of rows in each component
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return cityArray[component].count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[component][row]
    }
    
    //function to assign value in each row
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = cityArray[component][row]
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.font = UIFont(name: "Times New Roman", size: 16)
        pickerLabel.textAlignment = .Center
        return pickerLabel
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
//*************************************************************************************************
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }

//*************************************************************************************************
    func adjustingHeight(show:Bool, notification:NSNotification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        // 3
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        // 4
        let changeInHeight = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
        //5
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.shopNameBottomConstraint.constant += changeInHeight
        })
        
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
