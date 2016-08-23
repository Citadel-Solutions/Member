//
//  CustomerViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 26/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var customerListFlag = "0"

class CustomerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var customerTableView: UITableView!
    @IBOutlet weak var customerTypeButton: UIButton!
    //declare array of customer list
    var customerEmailList:[String] = ["delissa.kimmince@gmail.com", "jackson.bird@gmail.com", "john.hastings@gmail.com", "jess.cameron@gmail.com", "joe.burns@gmail.com", "george.bailey@gmail.com", "megan.schutt@gmail.com", "steve.smith@gmail.com", "adam.voges@gmail.com", "sarah.coyte@gmail.com", "julie.hunter@gmail.com", "chris.lynn@gmail.com", "peter.nevill@gmail.com", "cameron.bancroft@gmail.com"]
    var customerNameList:[String] = ["Delissa Kimmince", "Jackson Bird", "John Hastings", "Jess Cameron", "Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte", "Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft"]
    
    var activeCustomerEmailList:[String] = ["delissa.kimmince@gmail.com", "jackson.bird@gmail.com", "john.hastings@gmail.com", "jess.cameron@gmail.com", "joe.burns@gmail.com", "george.bailey@gmail.com", "megan.schutt@gmail.com", "steve.smith@gmail.com", "adam.voges@gmail.com", "sarah.coyte@gmail.com"]
    var activeCustomerNameList:[String] = ["Delissa Kimmince", "Jackson Bird", "John Hastings", "Jess Cameron", "Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte"]
    
    var deactivatedCustomerEmailList:[String] = ["julie.hunter@gmail.com", "chris.lynn@gmail.com", "peter.nevill@gmail.com", "cameron.bancroft@gmail.com"]
    var deactivatedCustomerNameList:[String] = ["Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leadListFlag = "0"
        self.customerTypeButton.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        customerTableView.reloadData()
        //animateTable()
    }

    
    //function to Animate the table data on load
    func animateTable() {
        customerTableView.reloadData()
        
        let cells = customerTableView.visibleCells
        let tableHeight: CGFloat = customerTableView.bounds.size.height
        
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
        if (customerListFlag == "0") {
            return customerNameList.count
        }
        else if(customerListFlag == "1") {
            return activeCustomerNameList.count
        }
        else if(customerListFlag == "2") {
            return deactivatedCustomerNameList.count
        }
        return 0
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customerCellData = tableView.dequeueReusableCellWithIdentifier("customerCell", forIndexPath: indexPath) as! CustomerTableViewCell
        
        
        if (customerListFlag == "0") {
            self.customerTypeButton.setTitle("All Customers", forState: .Normal)
            _ = customerTypeButton.frame.size.width
            customerTypeButton.sizeThatFits(CGSize(width: 82, height: CGFloat.max))
            
            customerCellData.customerNameTable.text = customerNameList[indexPath.row]
            customerCellData.customerEmailTable.text = customerEmailList[indexPath.row]
            customerCellData.customerMoreButton.tag = indexPath.row
        }
        else if(customerListFlag == "1") {
            self.customerTypeButton.setTitle("Active Customers", forState: .Normal)
            
            let newSize = customerTypeButton.sizeThatFits(CGSize(width: 102, height: CGFloat.max))
            var newFrame = customerTypeButton.frame
            newFrame.size = CGSize(width: max(newSize.width, 102), height: newSize.height)
            customerTypeButton.frame = newFrame;
            
            customerCellData.customerNameTable.text = activeCustomerNameList[indexPath.row]
            customerCellData.customerEmailTable.text = activeCustomerEmailList[indexPath.row]
            customerCellData.customerMoreButton.hidden = false
            customerCellData.customerMoreButton.tag = indexPath.row
        }
        else if(customerListFlag == "2") {
            self.customerTypeButton.setTitle("Deactivated Customers", forState: .Normal)
            let newSize = customerTypeButton.sizeThatFits(CGSize(width: 131, height: CGFloat.max))
            var newFrame = customerTypeButton.frame
            newFrame.size = CGSize(width: max(newSize.width, 131), height: newSize.height)
            customerTypeButton.frame = newFrame;
            self.customerTypeButton.titleLabel?.adjustsFontSizeToFitWidth
            self.customerTypeButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
            customerCellData.customerNameTable.text = deactivatedCustomerNameList[indexPath.row]
            customerCellData.customerNameTable.text = deactivatedCustomerEmailList[indexPath.row]
            customerCellData.customerMoreButton.tag = indexPath.row
            customerCellData.customerMoreButton.hidden = true
        }
        
        
        return customerCellData
    }
    
//
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            self.customerNameList.removeAtIndex(indexPath.row)
//            self.customerTableView.reloadData()
//        }
//    }
    
    @IBAction func customerMoreButtonTapped(sender: AnyObject) {
        let buttonTag = sender.tag
        print(buttonTag)
        
        let alertController = UIAlertController(title: "CUSTOMER", message: customerNameList[buttonTag], preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let imageView = UIImageView(frame: CGRectMake(12, 10, 45, 45))
        imageView.image = UIImage(named: "Info-48")
        
        alertController.view.addSubview(imageView)
        
        let deleteAction = UIAlertAction(title: "Deactivate Customer", style: UIAlertActionStyle.Destructive, handler: {(alert :UIAlertAction) in
            print("Delete button tapped")
        })
        alertController.addAction(deleteAction)
        
        let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {(alert :UIAlertAction) in
            print("OK button tapped")
        })
        alertController.addAction(okAction)
        
        alertController.popoverPresentationController?.sourceView = view
        alertController.popoverPresentationController?.sourceRect = sender.frame
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Left
        paragraphStyle.firstLineHeadIndent = 50.0
        
        let messageText = NSMutableAttributedString(
            string: "CUSTOMER",
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: UIFont.systemFontOfSize(14.0)
            ]
        )
        
        alertController.setValue(messageText, forKey: "attributedTitle")
        
        let messageText1 = NSMutableAttributedString(
            string: customerNameList[buttonTag],
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: UIFont.systemFontOfSize(14.0)
            ]
        )
        alertController.setValue(messageText1, forKey: "attributedMessage")
        
        presentViewController(alertController, animated: true, completion: nil)
    }
 //***********************************************************************************************
    
    @IBAction func expandCustomerListButtonTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        //        actionSheetController.addAction(cancelAction)
        //        //Create and add first option action
        //        let takePictureAction: UIAlertAction = UIAlertAction(title: "All Leads", style: .Default) { action -> Void in
        //            //Do some other stuff
        //        }
        
        //Create and add first option action
        let allLeadsAction: UIAlertAction = UIAlertAction(title: "All Customers", style: .Default) { action -> Void in
            //Do some other stuff
            customerListFlag = "0"
            
            self.customerTableView.reloadData()
        }
        actionSheetController.addAction(allLeadsAction)
        
        //Create and add first option action
        let activeLeadsAction: UIAlertAction = UIAlertAction(title: "Active Customers", style: .Default) { action -> Void in
            //Do some other stuff
            customerListFlag = "1"
            
            self.customerTableView.reloadData()
        }
        actionSheetController.addAction(activeLeadsAction)
        
        //Create and add a second option action
        let deactivatedLeadsAction: UIAlertAction = UIAlertAction(title: "Deactivated Customers", style: .Default) { action -> Void in
            //Do some other stuff
            customerListFlag = "2"
            
            self.customerTableView.reloadData()
        }
        actionSheetController.addAction(deactivatedLeadsAction)
        
        //We need to provide a popover sourceView when using it on iPad
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView;
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)

    }
    
    @IBAction func customerTypeButtonTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        //        actionSheetController.addAction(cancelAction)
        //        //Create and add first option action
        //        let takePictureAction: UIAlertAction = UIAlertAction(title: "All Leads", style: .Default) { action -> Void in
        //            //Do some other stuff
        //        }
        
        //Create and add first option action
        let allLeadsAction: UIAlertAction = UIAlertAction(title: "All Customers", style: .Default) { action -> Void in
            //Do some other stuff
            customerListFlag = "0"
            
            self.customerTableView.reloadData()
        }
        actionSheetController.addAction(allLeadsAction)
        
        //Create and add first option action
        let activeLeadsAction: UIAlertAction = UIAlertAction(title: "Active Customers", style: .Default) { action -> Void in
            //Do some other stuff
            customerListFlag = "1"
            
            self.customerTableView.reloadData()
        }
        actionSheetController.addAction(activeLeadsAction)
        
        //Create and add a second option action
        let deactivatedLeadsAction: UIAlertAction = UIAlertAction(title: "Deactivated Customers", style: .Default) { action -> Void in
            //Do some other stuff
            customerListFlag = "2"
            
            self.customerTableView.reloadData()
        }
        actionSheetController.addAction(deactivatedLeadsAction)
        
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
