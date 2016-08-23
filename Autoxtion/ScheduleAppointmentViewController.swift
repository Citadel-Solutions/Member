//
//  ScheduleAppointmentViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 12/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class ScheduleAppointmentViewController: UIViewController {
   
    @IBOutlet weak var scheduleAppointmentFromTime: UITextField!
    @IBOutlet weak var scheduleAppointmentToTime: UITextField!
    
    @IBOutlet weak var fromTimeView: UIView!
    @IBOutlet weak var toTimeView: UIView!
    @IBOutlet weak var scheduleAppointmentView: UIView!
    
    @IBOutlet weak var scheduleCustomerName: UITextField!
    @IBOutlet weak var scheduleServiceType: UITextField!
    @IBOutlet weak var schedulePromotion: UITextField!
    @IBOutlet weak var scheduleDiscount: UITextField!
    @IBOutlet weak var scheduleCouponCode: UITextField!
    @IBOutlet weak var schdeuleFromDate: UITextField!
    @IBOutlet weak var scheduleToDate: UITextField!
    @IBOutlet weak var scheduleServiceDescription: UITextView!
    
    @IBOutlet weak var customerNameView: UIView!
    @IBOutlet weak var serviceTypeView: UIView!
    @IBOutlet weak var promotionView: UIView!
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var fromDateView: UIView!
    
    var dateFlag = "1"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ScheduleAppointmentViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.scheduleCustomerName.userInteractionEnabled = false
        self.scheduleServiceType.userInteractionEnabled = false
        self.schedulePromotion.userInteractionEnabled = false
        self.scheduleDiscount.userInteractionEnabled = false
        self.scheduleCouponCode.userInteractionEnabled = false
        self.schdeuleFromDate.userInteractionEnabled = false
        self.scheduleToDate.userInteractionEnabled = false
        self.scheduleServiceDescription.userInteractionEnabled = false
        //*************************************************************************************
        
        let buttonColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0)
        let buttonColor1 = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 0.50)
        
        let bottomBorderPersonalInfoView = CALayer()
        bottomBorderPersonalInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderPersonalInfoView.frame = CGRectMake(0.0, self.scheduleAppointmentView.frame.size.height-1, 800, 1.0)
        bottomBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        self.scheduleAppointmentView.layer .addSublayer(bottomBorderPersonalInfoView)
        
        let topBorderPersonalInfoView = CALayer()
        topBorderPersonalInfoView.backgroundColor = buttonColor.CGColor
        topBorderPersonalInfoView.frame = CGRectMake(0, 0, 800, 1)
        self.scheduleAppointmentView.layer .addSublayer(topBorderPersonalInfoView)
        
        let bottomBorderShopInfoView = CALayer()
        bottomBorderShopInfoView.borderColor = UIColor.grayColor().CGColor
        bottomBorderShopInfoView.frame = CGRectMake(0.0, self.fromTimeView.frame.size.height-1, 800, 1.0)
        bottomBorderShopInfoView.backgroundColor = buttonColor1.CGColor
        self.fromTimeView.layer .addSublayer(bottomBorderShopInfoView)
        
        let bottomBorderChangePasswordView = CALayer()
        bottomBorderChangePasswordView.borderColor = UIColor.grayColor().CGColor
        bottomBorderChangePasswordView.frame = CGRectMake(0.0, self.toTimeView.frame.size.height-1, 800, 1.0)
        bottomBorderChangePasswordView.backgroundColor = buttonColor.CGColor
        self.toTimeView.layer .addSublayer(bottomBorderChangePasswordView)
        
        let bottomBorderCustomerNameView = CALayer()
        bottomBorderCustomerNameView.borderColor = UIColor.grayColor().CGColor
        bottomBorderCustomerNameView.frame = CGRectMake(0.0, self.customerNameView.frame.size.height-1, 800, 1.0)
        bottomBorderCustomerNameView.backgroundColor = buttonColor1.CGColor
        self.customerNameView.layer .addSublayer(bottomBorderCustomerNameView)
        
        let bottomBorderServiceTypeView = CALayer()
        bottomBorderServiceTypeView.borderColor = UIColor.grayColor().CGColor
        bottomBorderServiceTypeView.frame = CGRectMake(0.0, self.serviceTypeView.frame.size.height-1, 800, 1.0)
        bottomBorderServiceTypeView.backgroundColor = buttonColor1.CGColor
        self.serviceTypeView.layer .addSublayer(bottomBorderServiceTypeView)
        
        let bottomBorderschedulePromotionView = CALayer()
        bottomBorderschedulePromotionView.borderColor = UIColor.grayColor().CGColor
        bottomBorderschedulePromotionView.frame = CGRectMake(0.0, self.promotionView.frame.size.height-1, 800, 1.0)
        bottomBorderschedulePromotionView.backgroundColor = buttonColor1.CGColor
        self.promotionView.layer .addSublayer(bottomBorderschedulePromotionView)
        
        let bottomBorderDiscountView = CALayer()
        bottomBorderDiscountView.borderColor = UIColor.grayColor().CGColor
        bottomBorderDiscountView.frame = CGRectMake(0.0, self.discountView.frame.size.height-1, 800, 1.0)
        bottomBorderDiscountView.backgroundColor = buttonColor1.CGColor
        self.discountView.layer .addSublayer(bottomBorderDiscountView)
        
        let bottomBorderFromDateView = CALayer()
        bottomBorderFromDateView.borderColor = UIColor.grayColor().CGColor
        bottomBorderFromDateView.frame = CGRectMake(0.0, self.fromDateView.frame.size.height-1, 800, 1.0)
        bottomBorderFromDateView.backgroundColor = buttonColor1.CGColor
        self.fromDateView.layer .addSublayer(bottomBorderFromDateView)
        
        
   //*************************************************************************************
//        self.scheduleServiceDescription.layer.cornerRadius = 3
//        self.scheduleServiceDescription.layer.borderWidth = 1
//        self.scheduleServiceDescription.layer.borderColor = buttonColor.CGColor
        

        // Do any additional setup after loading the view.
        
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
        
        scheduleAppointmentFromTime.inputAccessoryView = toolBar
        
        scheduleAppointmentToTime.inputAccessoryView = toolBar
        
        
        
        self.scheduleCustomerName.text = customerNameRequest
        self.scheduleServiceType.text = serviceTypeRequest
        self.scheduleCouponCode.text = couponCodeRequest
        self.scheduleServiceDescription.text = serviceTypeRequest
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
//*****************************************************************************************************

    
//    @IBAction func dateTextFieldEditing(sender: UITextField) {
//        let datePickerView:UIDatePicker = UIDatePicker()
//        
//        datePickerView.datePickerMode = UIDatePickerMode.Date
//        
//        sender.inputView = datePickerView
//        
//        dateFlag = "0"
//        
//        datePickerView.addTarget(self, action: #selector(ScheduleAppointmentViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
//        
//    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
//        if (dateFlag == "0") {
//            scheduleAppointmentDate.text = dateFormatter.stringFromDate(sender.date)
//            
//        }
        if (dateFlag == "1") {
            scheduleAppointmentFromTime.text = dateFormatter.stringFromDate(sender.date)
            
        }
        else if (dateFlag == "2") {
            scheduleAppointmentToTime.text = dateFormatter.stringFromDate(sender.date)
            
        }
        
    }
    
    @IBAction func fromTimeScheduleAppointmentEditing(sender: UITextField) {
        let datePickerView1:UIDatePicker = UIDatePicker()
        
        datePickerView1.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView1
        
        dateFlag = "1"
        
        datePickerView1.addTarget(self, action: #selector(ScheduleAppointmentViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func toTimeScheduleAppointmentEditing(sender: UITextField) {
        let datePickerView2:UIDatePicker = UIDatePicker()
        
        datePickerView2.datePickerMode = UIDatePickerMode.DateAndTime
        
        sender.inputView = datePickerView2
        
        dateFlag = "2"
        
        datePickerView2.addTarget(self, action: #selector(ScheduleAppointmentViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func donePressed(sender: UIBarButtonItem) {
        if (dateFlag == "1") {
            scheduleAppointmentFromTime.resignFirstResponder()
        }
        else if (dateFlag == "2") {
            scheduleAppointmentToTime.resignFirstResponder()
        }
    }
    
    
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateformatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        if (dateFlag == "1") {
            scheduleAppointmentFromTime.text = dateformatter.stringFromDate(NSDate())
            
            scheduleAppointmentFromTime.resignFirstResponder()
        }
        else if (dateFlag == "2") {
            scheduleAppointmentToTime.text = dateformatter.stringFromDate(NSDate())
            
            scheduleAppointmentToTime.resignFirstResponder()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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
