//
//  AppointmentViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 26/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var appointmentListFlag = "0"

class AppointmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var appointmentTypeButton: UIButton!
    @IBOutlet weak var appointmentTableView: UITableView!
    
    var appointmentServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment", "Full Car Service", "LPG Installation", "Tyres", "Air Conditioner Service", "Clutch & Transmission", "Brakes", "Radiators & Cooling", "Batteries", "Exhausts"]
    
    var appointmentCustomerNameList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte", "Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft", "Delissa Kimmince", "Jackson Bird"]
    
    var appointmentDateList:[String] = ["2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17"]
    
    var completedAppointmentServiceTypeList:[String] = ["Air Conditioner Service", "Clutch & Transmission", "Brakes", "Radiators & Cooling", "Batteries", "Exhausts"]
    
    var completedAppointmentCustomerNameList:[String] = ["Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft", "Delissa Kimmince", "Jackson Bird"]
    
    var completedAppointmentDateList:[String] = ["2016-08-15", "2016-08-15", "2016-08-15", "2016-08-15", "2016-08-15", "2016-08-15"]
    
    var pendingAppointmentServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment", "Full Car Service", "LPG Installation", "Tyres"]
    
    var pendingAppointmentCustomerNameList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte"]
    
    var pendingAppointmentDateList:[String] = ["2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17", "2016-08-17"]

    override func viewDidLoad() {
        super.viewDidLoad()

        appointmentListFlag = "0"
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AppointmentViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        self.appointmentTypeButton.sizeToFit()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        appointmentTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        appointmentTableView.reloadData()
        
        let cells = appointmentTableView.visibleCells
        let tableHeight: CGFloat = appointmentTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionNone, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    //function for the number of rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (appointmentListFlag == "0") {
            return appointmentCustomerNameList.count
        }
        else if(appointmentListFlag == "1") {
            return completedAppointmentCustomerNameList.count
        }
        else if(appointmentListFlag == "2") {
            return pendingAppointmentCustomerNameList.count
        }
        return 0
        //return appointmentCustomerNameList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let appointmentCellData = tableView.dequeueReusableCellWithIdentifier("appointmentCell", forIndexPath: indexPath) as! AppointmentTableViewCell
      
        if (appointmentListFlag == "0") {
            self.appointmentTypeButton.setTitle("All Appointments", forState: .Normal)
            _ = appointmentTypeButton.frame.size.width
            appointmentTypeButton.sizeThatFits(CGSize(width: 101, height: CGFloat.max))
            
            
            appointmentCellData.appointmentCustomerName.text = appointmentCustomerNameList[indexPath.row]
            appointmentCellData.appointmentServiceType.text = appointmentServiceTypeList[indexPath.row]
            appointmentCellData.appointmentDate.text = appointmentDateList[indexPath.row]
            
            let image = UIImage(named: "jobComplete.png")
            appointmentCellData.jobCompletedButton.setTitle("Job Complete", forState: .Normal)
            appointmentCellData.jobCompletedButton.setImage(image, forState: .Normal)
            appointmentCellData.jobCompletedButton.tag = indexPath.row
        }
        else if(appointmentListFlag == "1") {
            self.appointmentTypeButton.setTitle("Completed Appointments", forState: .Normal)
            _ = appointmentTypeButton.frame.size.width
            appointmentTypeButton.sizeThatFits(CGSize(width: 125, height: CGFloat.max))
            
            appointmentCellData.appointmentCustomerName.text = completedAppointmentCustomerNameList[indexPath.row]
            appointmentCellData.appointmentServiceType.text = completedAppointmentServiceTypeList[indexPath.row]
            appointmentCellData.appointmentDate.text = completedAppointmentDateList[indexPath.row]
            
            let image = UIImage(named: "jobDone.png")
            appointmentCellData.jobCompletedButton.setTitle("", forState: .Normal)
            appointmentCellData.jobCompletedButton.setImage(image, forState: .Normal)
            appointmentCellData.jobCompletedButton.tag = indexPath.row
        }
        else if(appointmentListFlag == "2") {
            self.appointmentTypeButton.setTitle("Scheduled Appointments", forState: .Normal)
            _ = appointmentTypeButton.frame.size.width
            appointmentTypeButton.sizeThatFits(CGSize(width: 125, height: CGFloat.max))
            
            appointmentCellData.appointmentCustomerName.text = pendingAppointmentCustomerNameList[indexPath.row]
            appointmentCellData.appointmentServiceType.text = pendingAppointmentServiceTypeList[indexPath.row]
            appointmentCellData.appointmentDate.text = pendingAppointmentDateList[indexPath.row]
            
            let image = UIImage(named: "jobComplete.png")
            appointmentCellData.jobCompletedButton.setTitle("Job Complete", forState: .Normal)
            appointmentCellData.jobCompletedButton.setImage(image, forState: .Normal)
            appointmentCellData.jobCompletedButton.tag = indexPath.row
        }
        
//        appointmentCellData.jobCompletedButton.layer.borderWidth = 1
//        appointmentCellData.jobCompletedButton.layer.borderColor = buttonColor
        
        return appointmentCellData
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.appointmentCustomerNameList.removeAtIndex(indexPath.row)
            self.appointmentTableView.reloadData()
        }
    }
    
    @IBAction func jobCompletedButtonTapped(sender: UIButton) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "Are you sure you want to complete the job?", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Ok", style: .Default) { action -> Void in
            //Do some other stuff
            _ = sender.tag
            
            let image = UIImage(named: "jobDone.png")
            
            sender.setTitle("", forState: .Normal)
            sender.setImage(image, forState: .Normal)
            sender.userInteractionEnabled = false
            
        }
        actionSheetController.addAction(nextAction)
        
        let buttonColor = UIColor(red: 68/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
        
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            //TextField configuration
            textField.placeholder = "Add comments for service"
            textField.textColor = buttonColor
        }
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    
    @IBAction func expandListButtonTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
      
        //Create and add first option action
        let allAppointmentsAction: UIAlertAction = UIAlertAction(title: "All Appointments", style: .Default) { action -> Void in
            //Do some other stuff
            appointmentListFlag = "0"
            
            self.appointmentTableView.reloadData()
        }
        actionSheetController.addAction(allAppointmentsAction)
        
        //Create and add first option action
        let activeAppointmentsAction: UIAlertAction = UIAlertAction(title: "Completed Appointments", style: .Default) { action -> Void in
            //Do some other stuff
            appointmentListFlag = "1"
            
            self.appointmentTableView.reloadData()
        }
        actionSheetController.addAction(activeAppointmentsAction)
        
        //Create and add a second option action
        let deactivatedAppointmentsAction: UIAlertAction = UIAlertAction(title: "Scheduled Appointments", style: .Default) { action -> Void in
            //Do some other stuff
            appointmentListFlag = "2"
            
            self.appointmentTableView.reloadData()
        }
        actionSheetController.addAction(deactivatedAppointmentsAction)
        
        //We need to provide a popover sourceView when using it on iPad
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView;
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func appointmentsTypeButtonTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        //Create and add first option action
        let allAppointmentsAction: UIAlertAction = UIAlertAction(title: "All Appointments", style: .Default) { action -> Void in
            //Do some other stuff
            appointmentListFlag = "0"
            
            self.appointmentTableView.reloadData()
        }
        actionSheetController.addAction(allAppointmentsAction)
        
        //Create and add first option action
        let activeAppointmentsAction: UIAlertAction = UIAlertAction(title: "Completed Appointments", style: .Default) { action -> Void in
            //Do some other stuff
            appointmentListFlag = "1"
            
            self.appointmentTableView.reloadData()
        }
        actionSheetController.addAction(activeAppointmentsAction)
        
        //Create and add a second option action
        let deactivatedAppointmentsAction: UIAlertAction = UIAlertAction(title: "Scheduled Appointments", style: .Default) { action -> Void in
            //Do some other stuff
            appointmentListFlag = "2"
            
            self.appointmentTableView.reloadData()
        }
        actionSheetController.addAction(deactivatedAppointmentsAction)
        
        //We need to provide a popover sourceView when using it on iPad
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView;
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
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
