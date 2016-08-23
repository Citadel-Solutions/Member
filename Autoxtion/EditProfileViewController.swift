//
//  EditProfileViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 08/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var personaInfoEditProfileView: UIView!
    
    @IBOutlet weak var changePasswordEditProfileView: UIView!
    
    @IBOutlet weak var firstNameEditProfile: UITextField!
    @IBOutlet weak var lastNameEditProfile: UITextField!
    @IBOutlet weak var phoneNumberEditProfile: UITextField!
    @IBOutlet weak var emailEditProfile: UITextField!
    @IBOutlet weak var countryCityPickerEditProfile: UIPickerView!
    
    @IBOutlet weak var shopInfoEditProfileView: UIView!
    @IBOutlet weak var shopNameEditProfile: UITextField!
    @IBOutlet weak var shopAddressEditProfile: UITextField!
    @IBOutlet weak var websiteEditProfile: UITextField!
    
    var cityArray: [[String]] = [["Select Country", "Australia"], ["Select City", "Melbourne", "Sydney", "Canberra", "Adelaide", "Maryborough", "Bairnsdale", "Bendigo"]]
    
    //declare array to display picker(for year in payment)
    var yearArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderPersonalInfoView = CALayer()
        bottomBorderPersonalInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPersonalInfoView.frame = CGRectMake(0.0, self.personaInfoEditProfileView.frame.size.height-1, 800, 1.0)
        bottomBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        self.personaInfoEditProfileView.layer .addSublayer(bottomBorderPersonalInfoView)
        
        let topBorderPersonalInfoView = CALayer()
        topBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        topBorderPersonalInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.personaInfoEditProfileView.layer .addSublayer(topBorderPersonalInfoView)
        
        let topBorderShopInfoView = CALayer()
        topBorderShopInfoView.backgroundColor = buttonColor.CGColor
        topBorderShopInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.shopInfoEditProfileView.layer .addSublayer(topBorderShopInfoView)
        
        let topBorderChangePasswordView = CALayer()
        topBorderChangePasswordView.backgroundColor = buttonColor.CGColor
        topBorderChangePasswordView.frame = CGRectMake(0, 0, 800, 1)
        self.changePasswordEditProfileView.layer .addSublayer(topBorderChangePasswordView)
        
        let bottomBorderShopInfoView = CALayer()
        bottomBorderShopInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderShopInfoView.frame = CGRectMake(0.0, self.shopInfoEditProfileView.frame.size.height-1, 800, 1.0)
        bottomBorderShopInfoView.backgroundColor = buttonColor.CGColor
        self.shopInfoEditProfileView.layer .addSublayer(bottomBorderShopInfoView)
        
        let bottomBorderChangePasswordView = CALayer()
        bottomBorderChangePasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderChangePasswordView.frame = CGRectMake(0.0, self.changePasswordEditProfileView.frame.size.height-1, 800, 1.0)
        bottomBorderChangePasswordView.backgroundColor = buttonColor.CGColor
        self.changePasswordEditProfileView.layer .addSublayer(bottomBorderChangePasswordView)
        
        
        //bottom border to Register First Name
//        let bottomBorderProfileFirstName = CALayer()
//        bottomBorderProfileFirstName.borderColor = UIColor.grayColor().CGColor
//        bottomBorderProfileFirstName.frame = CGRectMake(0.0, self.firstNameEditProfile.frame.size.height-1, 800, 1.0)
//        bottomBorderProfileFirstName.backgroundColor = buttonColor1.CGColor
//        self.firstNameEditProfile.layer .addSublayer(bottomBorderProfileFirstName)
        
        //bottom border to Register Last Name
        let bottomBorderProfileLastName = CALayer()
        bottomBorderProfileLastName.borderColor = UIColor.grayColor().CGColor
        bottomBorderProfileLastName.frame = CGRectMake(0.0, self.lastNameEditProfile.frame.size.height-1, 800, 1.0)
        bottomBorderProfileLastName.backgroundColor = buttonColor1.CGColor
        self.lastNameEditProfile.layer .addSublayer(bottomBorderProfileLastName)
        
        //bottom border to Register Phone Number
        let bottomBorderProfilePhone = CALayer()
        bottomBorderProfilePhone.borderColor = UIColor.grayColor().CGColor
        bottomBorderProfilePhone.frame = CGRectMake(0.0, self.phoneNumberEditProfile.frame.size.height-1, 800, 1.0)
        bottomBorderProfilePhone.backgroundColor = buttonColor1.CGColor
        self.phoneNumberEditProfile.layer .addSublayer(bottomBorderProfilePhone)
        
        //bottom border to Register Shop Name
        let bottomBorderProfileShopName = CALayer()
        bottomBorderProfileShopName.borderColor = UIColor.grayColor().CGColor
        bottomBorderProfileShopName.frame = CGRectMake(0.0, self.shopNameEditProfile.frame.size.height-1, 800, 1.0)
        bottomBorderProfileShopName.backgroundColor = buttonColor1.CGColor
        self.shopNameEditProfile.layer .addSublayer(bottomBorderProfileShopName)
        
        //bottom border to Register Shop Address
        let bottomBorderProfileShopAddress = CALayer()
        bottomBorderProfileShopAddress.borderColor = UIColor.grayColor().CGColor
        bottomBorderProfileShopAddress.frame = CGRectMake(0.0, self.shopAddressEditProfile.frame.size.height-1, 800, 1.0)
        bottomBorderProfileShopAddress.backgroundColor = buttonColor1.CGColor
        self.shopAddressEditProfile.layer .addSublayer(bottomBorderProfileShopAddress)
        
        //bottom border to Register website
        let bottomBorderProfileWebsite = CALayer()
        bottomBorderProfileWebsite.borderColor = UIColor.grayColor().CGColor
        bottomBorderProfileWebsite.frame = CGRectMake(0.0, self.websiteEditProfile.frame.size.height-1, 800, 1.0)
        bottomBorderProfileWebsite.backgroundColor = buttonColor1.CGColor
        self.websiteEditProfile.layer .addSublayer(bottomBorderProfileWebsite)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function for number of components in pickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        print(cityArray.count)
        return cityArray.count
    }
    
    //function for the number of rows in each component
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //        if pickerView == countryCityPicker
        //        {
        return cityArray[component].count
        //        }
        //        else if pickerView == expiryDatePicker
        //        {
        //            return paymentArray[component].count
        //        }
        //        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //        if pickerView == countryCityPicker
        //        {
        //arraystring = cityArray[component][row]
        //        }
        //        else if pickerView == expiryDatePicker
        //        {
        //            arraystring = paymentArray[component][row]
        //        }
        
        return cityArray[component][row]
    }
    
    //function to assign value in each row
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        //        if pickerView == countryCityPicker
        //        {
        pickerLabel.text = cityArray[component][row]
        //        }
        //        else if pickerView == expiryDatePicker
        //        {
        //            pickerLabel.text = paymentArray[component][row]
        //        }
        //pickerLabel.text = cityArray[component][row]
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
