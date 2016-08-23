//
//  RequestViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 26/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var customerNameRequest = ""
var serviceTypeRequest = ""
var couponCodeRequest = ""

class RequestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var requestTableView: UITableView!
    
    var requestServiceTypeList:[String] = ["Auto Electrical Services", "Engine Management Diagnostics", "Wheel Alignment", "Full Car Service", "LPG Installation", "Tyres", "Air Conditioner Service", "Clutch & Transmission", "Brakes", "Radiators & Cooling", "Batteries", "Exhausts"]
    
    var requestCustomerNameList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte", "Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft", "Delissa Kimmince", "Jackson Bird"]
    
    var requestCouponCodeList:[String] = ["AXNZRKF50", "AXNYIZF40", "AXNIMKT12", "AXNNYPY45", "AXNZRKF51", "AXNYIZF41", "AXNIMKT18", "AXNNYPY49", "AXNZRKF56", "AXNYIZF44", "AXNIMKT16", "AXNNYPY43"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        requestTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        requestTableView.reloadData()
        
        let cells = requestTableView.visibleCells
        let tableHeight: CGFloat = requestTableView.bounds.size.height
        
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
        return requestCustomerNameList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let requestCellData = tableView.dequeueReusableCellWithIdentifier("requestCell", forIndexPath: indexPath) as! RequestTableViewCell
        
        requestCellData.requestCustomerName.text = requestCustomerNameList[indexPath.row]
        requestCellData.requestServiceType.text = requestServiceTypeList[indexPath.row]
        requestCellData.requestCouponCode.text = requestCouponCodeList[indexPath.row]
        
        let loginbuttonColor = UIColor(red: 243.0/255.0, green: 134.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        requestCellData.requestScheduleAppointment.layer.cornerRadius = 3
        requestCellData.requestScheduleAppointment.layer.borderWidth = 1
        requestCellData.requestScheduleAppointment.layer.backgroundColor = loginbuttonColor.CGColor
        requestCellData.requestScheduleAppointment.layer.borderColor = loginbuttonColor.CGColor
        requestCellData.requestScheduleAppointment.tag = indexPath.row
        
        return requestCellData
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.requestCustomerNameList.removeAtIndex(indexPath.row)
            self.requestTableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        customerNameRequest = requestCustomerNameList[indexPath.row]
        serviceTypeRequest = requestServiceTypeList[indexPath.row]
        couponCodeRequest = requestCouponCodeList[indexPath.row]
        
        print(customerNameRequest)
        print(serviceTypeRequest)
        print(couponCodeRequest)
    }
    
    @IBAction func scheduleButtonTapped(sender: AnyObject) {
        let row = sender.tag
        
        customerNameRequest = requestCustomerNameList[row]
        serviceTypeRequest = requestServiceTypeList[row]
        couponCodeRequest = requestCouponCodeList[row]
        
        print(customerNameRequest)
        print(serviceTypeRequest)
        print(couponCodeRequest)
        
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
