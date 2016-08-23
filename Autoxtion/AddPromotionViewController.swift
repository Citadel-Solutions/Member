//
//  AddPromotionViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 16/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class AddPromotionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var serviceTypePickerData: [String] = ["Full Car Service", "LPG Installations", "Wheel Alignment", "Engine Maintenance", "Auto Electrical Services", "Steering & Suspensions", "Fleet Vehicles", "Brakes", "Batteries", "Others"]

    @IBOutlet weak var promotionFromDate: UITextField!
    @IBOutlet weak var promotionToDate: UITextField!
    
    var dateFlag = "1"
    
    @IBOutlet weak var promotionVehicleBrandView: UIStackView!
    @IBOutlet weak var promotionVehicleModelView: UIStackView!
    @IBOutlet weak var promotionVehicleYearView: UIStackView!
    @IBOutlet weak var promotionDiscountView: UIView!
    @IBOutlet weak var promotionDescriptionView: UIView!
    @IBOutlet weak var promotionCouponCodeVIew: UIView!
    @IBOutlet weak var promotionFromDateView: UIStackView!
    @IBOutlet weak var promotionToDateView: UIStackView!
    @IBOutlet weak var promotionServiceTypeStackView: UIStackView!
    
    @IBOutlet weak var promotionDiscountText: UITextField!
    @IBOutlet weak var promotionDescriptionText: UITextField!
    @IBOutlet weak var promotionImageView: UIImageView!
    @IBOutlet weak var addPromotionImageButton: UIButton!
    @IBOutlet weak var promotionCouponCodeText: UITextField!
    @IBOutlet weak var vehicleBrandButtonPromotion: UIButton!
    @IBOutlet weak var vehicleModelButtonPromotion: UIButton!
    @IBOutlet weak var vehicleMakeYrButtonPromotion: UIButton!
    @IBOutlet weak var vehicleServiceTypeButtonPromotion: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imagePicker.delegate = self
        self.promotionCouponCodeText.userInteractionEnabled = false
        
        print(addPromotionClicked)
        print(vehicleBrandPromotionSelected)
        print(vehicleModelPromotionSelected)
        print(vehicleYearPromotionSelected)
        
//        if addPromotionClicked == "yes" {
//            self.vehicleBrandButtonPromotion.setTitle("Select Vehicle Brand", forState: .Normal)
//            self.vehicleModelButtonPromotion.setTitle("Select Vehicle Model", forState: .Normal)
//            self.vehicleMakeYrButtonPromotion.setTitle("Select Vehicle Make Year", forState: .Normal)
//        }
//        else {
//            self.vehicleBrandButtonPromotion.setTitle(vehicleBrandPromotionSelected, forState: .Normal)
//            self.vehicleModelButtonPromotion.setTitle(vehicleModelPromotionSelected, forState: .Normal)
//            self.vehicleMakeYrButtonPromotion.setTitle(vehicleYearPromotionSelected, forState: .Normal)
//        }
        
        vehicleBrandButtonPromotion.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 17.0, bottom: 0.0, right: 0.0)
        vehicleModelButtonPromotion.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 17.0, bottom: 0.0, right: 0.0)
        vehicleMakeYrButtonPromotion.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 17.0, bottom: 0.0, right: 0.0)
        vehicleServiceTypeButtonPromotion.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 17.0, bottom: 0.0, right: 0.0)
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        self.promotionImageView.layer.cornerRadius = self.promotionImageView.frame.size.width/2
        self.promotionImageView.clipsToBounds = true
        self.promotionImageView.layer.borderWidth = 1
        self.promotionImageView.layer.borderColor = buttonColor.CGColor
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ScheduleAppointmentViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
               
        let bottomBorderVehicleBrandView = CALayer()
        bottomBorderVehicleBrandView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleBrandView.frame = CGRectMake(0.0, self.promotionVehicleBrandView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleBrandView.backgroundColor = buttonColor1.CGColor
        self.promotionVehicleBrandView.layer .addSublayer(bottomBorderVehicleBrandView)
        
        let bottomBorderVehicleModelView = CALayer()
        bottomBorderVehicleModelView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleModelView.frame = CGRectMake(0.0, self.promotionVehicleModelView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleModelView.backgroundColor = buttonColor1.CGColor
        self.promotionVehicleModelView.layer .addSublayer(bottomBorderVehicleModelView)
        
        let bottomBorderVehicleYearView = CALayer()
        bottomBorderVehicleYearView.borderColor = UIColor.grayColor().CGColor
        bottomBorderVehicleYearView.frame = CGRectMake(0.0, self.promotionVehicleYearView.frame.size.height-1, 800, 1.0)
        bottomBorderVehicleYearView.backgroundColor = buttonColor1.CGColor
        self.promotionVehicleYearView.layer .addSublayer(bottomBorderVehicleYearView)
        
        let bottomBorderServiceTypeView = CALayer()
        bottomBorderServiceTypeView.borderColor = UIColor.grayColor().CGColor
        bottomBorderServiceTypeView.frame = CGRectMake(0.0, self.promotionServiceTypeStackView.frame.size.height-1, 800, 1.0)
        bottomBorderServiceTypeView.backgroundColor = buttonColor1.CGColor
        self.promotionServiceTypeStackView.layer .addSublayer(bottomBorderServiceTypeView)
        
        let bottomBorderDiscountView = CALayer()
        bottomBorderDiscountView.borderColor = UIColor.grayColor().CGColor
        bottomBorderDiscountView.frame = CGRectMake(0.0, self.promotionDiscountView.frame.size.height-1, 800, 1.0)
        bottomBorderDiscountView.backgroundColor = buttonColor1.CGColor
        self.promotionDiscountView.layer .addSublayer(bottomBorderDiscountView)
        
        let bottomBorderDescriptionView = CALayer()
        bottomBorderDescriptionView.borderColor = UIColor.grayColor().CGColor
        bottomBorderDescriptionView.frame = CGRectMake(0.0, self.promotionDescriptionView.frame.size.height-1, 800, 1.0)
        bottomBorderDescriptionView.backgroundColor = buttonColor1.CGColor
        self.promotionDescriptionView.layer .addSublayer(bottomBorderDescriptionView)
        
        let bottomBorderFromDateView = CALayer()
        bottomBorderFromDateView.borderColor = UIColor.grayColor().CGColor
        bottomBorderFromDateView.frame = CGRectMake(0.0, self.promotionFromDateView.frame.size.height-1, 800, 1.0)
        bottomBorderFromDateView.backgroundColor = buttonColor1.CGColor
        self.promotionFromDateView.layer .addSublayer(bottomBorderFromDateView)
        
        let bottomBorderToDateView = CALayer()
        bottomBorderToDateView.borderColor = UIColor.grayColor().CGColor
        bottomBorderToDateView.frame = CGRectMake(0.0, self.promotionToDateView.frame.size.height-1, 800, 1.0)
        bottomBorderToDateView.backgroundColor = buttonColor.CGColor
        self.promotionToDateView.layer .addSublayer(bottomBorderToDateView)
        
        let bottomBorderPromotionCouponCodeVIew = CALayer()
        bottomBorderPromotionCouponCodeVIew.borderColor = UIColor.grayColor().CGColor
        bottomBorderPromotionCouponCodeVIew.frame = CGRectMake(0.0, self.promotionCouponCodeVIew.frame.size.height-1, 800, 1.0)
        bottomBorderPromotionCouponCodeVIew.backgroundColor = buttonColor.CGColor
        self.promotionCouponCodeVIew.layer .addSublayer(bottomBorderPromotionCouponCodeVIew)
        //*************************************************************************************
        
        let toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        
        let toolbarColor = UIColor(red: 68/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.BlackTranslucent
        
        toolBar.tintColor = UIColor.whiteColor()
        
        toolBar.backgroundColor = buttonColor
        
        
        let todayBtn = UIBarButtonItem(title: "Today", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ScheduleAppointmentViewController.tappedToolBarBtn))
        
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(ScheduleAppointmentViewController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        
        label.backgroundColor = UIColor.clearColor()
        
        label.textColor = toolbarColor
        
        label.text = "Select"
        
        label.textAlignment = NSTextAlignment.Center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([todayBtn,flexSpace,textBtn,flexSpace,okBarBtn], animated: true)
        
        //scheduleAppointmentDate.inputAccessoryView = toolBar
        
        promotionFromDate.inputAccessoryView = toolBar
        
        promotionToDate.inputAccessoryView = toolBar
    }
  
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.darkGrayColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Promotion Description"
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func promotionFromDateTapped(sender: UITextField) {
        let datePickerView1:UIDatePicker = UIDatePicker()
        
        datePickerView1.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView1
        
        dateFlag = "1"
        
        datePickerView1.addTarget(self, action: #selector(ScheduleAppointmentViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        //        if (dateFlag == "0") {
        //            scheduleAppointmentDate.text = dateFormatter.stringFromDate(sender.date)
        //
        //        }
        if (dateFlag == "1") {
            promotionFromDate.text = dateFormatter.stringFromDate(sender.date)
            
        }
        else if (dateFlag == "2") {
            promotionToDate.text = dateFormatter.stringFromDate(sender.date)
            
        }
        
    }
    
    @IBAction func promotionToDateTapped(sender: UITextField) {
        let datePickerView2:UIDatePicker = UIDatePicker()
        
        datePickerView2.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView2
        
        dateFlag = "2"
        
        datePickerView2.addTarget(self, action: #selector(ScheduleAppointmentViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func donePressed(sender: UIBarButtonItem) {
        if (dateFlag == "1") {
            promotionFromDate.resignFirstResponder()
        }
        else if (dateFlag == "2") {
            promotionToDate.resignFirstResponder()
        }
    }
    
    
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateformatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        if (dateFlag == "1") {
            promotionFromDate.text = dateformatter.stringFromDate(NSDate())
            
            promotionFromDate.resignFirstResponder()
        }
        else if (dateFlag == "2") {
            promotionToDate.text = dateformatter.stringFromDate(NSDate())
            
            promotionToDate.resignFirstResponder()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func addPromotionImageButtonTapped(sender: AnyObject) {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        promotionImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.addPromotionImageButton.setTitleColor(UIColor.clearColor(), forState: .Normal)
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
