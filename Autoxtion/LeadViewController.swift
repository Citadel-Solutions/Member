//
//  LeadViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 26/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var leadListFlag = "0"
var newLeadClicked = "no"

class LeadViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var leadTableView: UITableView!
    @IBOutlet weak var leadTypeButton: UIButton!
    //declare array of Lead list
    var leadEmailList:[String] = ["joe.burns@gmail.com", "george.bailey@gmail.com", "megan.schutt@gmail.com", "steve.smith@gmail.com", "adam.voges@gmail.com", "sarah.coyte@gmail.com", "julie.hunter@gmail.com", "chris.lynn@gmail.com", "peter.nevill@gmail.com", "cameron.bancroft@gmail.com"]
    
    var leadNameList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte", "Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft"]
    
    var activeLeadEmailList:[String] = ["joe.burns@gmail.com", "george.bailey@gmail.com", "megan.schutt@gmail.com", "steve.smith@gmail.com", "adam.voges@gmail.com", "sarah.coyte@gmail.com", "julie.hunter@gmail.com", "chris.lynn@gmail.com"]
    
    var activeLeadNameList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte", "Julie Hunter", "Chris Lynn"]
    
    var deactivatedLeadEmailList:[String] = ["peter.nevill@gmail.com", "cameron.bancroft@gmail.com"]
    
    var deactivatedLeadNameList:[String] = ["Peter Nevill", "Cameron Bancroft"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leadListFlag = "0"
        
        self.leadTypeButton.sizeToFit()
        
        fetchLeadList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        leadTableView.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        leadTableView.reloadData()
        
        let cells = leadTableView.visibleCells
        let tableHeight: CGFloat = leadTableView.bounds.size.height
        
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
    
//*************************************************************************************************************************************************
    //function for the number of rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (leadListFlag == "0") {
            return leadNameList.count
        }
        else if(leadListFlag == "1") {
            return activeLeadNameList.count
        }
        else if(leadListFlag == "2") {
            return deactivatedLeadNameList.count
        }
        return 0
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let leadCellData = tableView.dequeueReusableCellWithIdentifier("leadCell", forIndexPath: indexPath) as! LeadTableViewCell
        
        if (leadListFlag == "0") {
            self.leadTypeButton.setTitle("All Leads", forState: .Normal)
            _ = leadTypeButton.frame.size.width
            leadTypeButton.sizeThatFits(CGSize(width: 63, height: CGFloat.max))
            
            leadCellData.leadNameTable.text = leadNameList[indexPath.row]
            leadCellData.leadEmailTable.text = leadEmailList[indexPath.row]
            leadCellData.leadMoreButton.hidden = false
            leadCellData.leadMoreButton.tag = indexPath.row
        }
        else if(leadListFlag == "1") {
            self.leadTypeButton.setTitle("Active Leads", forState: .Normal)
            let newSize = leadTypeButton.sizeThatFits(CGSize(width: 77, height: CGFloat.max))
            var newFrame = leadTypeButton.frame
            newFrame.size = CGSize(width: max(newSize.width, 77), height: newSize.height)
            leadTypeButton.frame = newFrame;
            
            leadCellData.leadNameTable.text = activeLeadNameList[indexPath.row]
            leadCellData.leadEmailTable.text = activeLeadEmailList[indexPath.row]
            leadCellData.leadMoreButton.hidden = false
            leadCellData.leadMoreButton.tag = indexPath.row
        }
        else if(leadListFlag == "2") {
            self.leadTypeButton.setTitle("Deactivated Leads", forState: .Normal)
            let newSize = leadTypeButton.sizeThatFits(CGSize(width: 107, height: CGFloat.max))
            var newFrame = leadTypeButton.frame
            newFrame.size = CGSize(width: max(newSize.width, 107), height: newSize.height)
            leadTypeButton.frame = newFrame;self.leadTypeButton.titleLabel?.adjustsFontSizeToFitWidth
            self.leadTypeButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            
            leadCellData.leadNameTable.text = deactivatedLeadNameList[indexPath.row]
            leadCellData.leadEmailTable.text = deactivatedLeadEmailList[indexPath.row]
            leadCellData.leadMoreButton.tag = indexPath.row
            leadCellData.leadMoreButton.hidden = true
        }
        return leadCellData
    }
    
//*************************************************************************************************************************************************
    //popup to Deactivate lead
    @IBAction func leadMoreButtonTapped(sender: AnyObject) {
        let buttonTag = sender.tag
        print(buttonTag)
        
        let alertController = UIAlertController(title: "LEAD", message: leadNameList[buttonTag], preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let imageView = UIImageView(frame: CGRectMake(12, 4, 45, 45))
        imageView.image = UIImage(named: "Info-48")
        
        alertController.view.addSubview(imageView)
        
        let deleteAction = UIAlertAction(title: "Deactivate Lead", style: UIAlertActionStyle.Destructive, handler: {(alert :UIAlertAction) in
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
            string: "LEAD",
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: UIFont.systemFontOfSize(14.0)
            ]
        )
        
        alertController.setValue(messageText, forKey: "attributedTitle")
        
        let messageText1 = NSMutableAttributedString(
            string: leadNameList[buttonTag],
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: UIFont.systemFontOfSize(14.0)
            ]
        )
        alertController.setValue(messageText1, forKey: "attributedMessage")
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
//*************************************************************************************************************************************************
    //pop-up to select Lead list(All, Active & Deactivated)
    @IBAction func expandListButtonTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        //Create and add first option action
        let allLeadsAction: UIAlertAction = UIAlertAction(title: "All Leads", style: .Default) { action -> Void in
            leadListFlag = "0"
            self.leadTableView.reloadData()
        }
        actionSheetController.addAction(allLeadsAction)
        
        //Create and add first option action
        let activeLeadsAction: UIAlertAction = UIAlertAction(title: "Active Leads", style: .Default) { action -> Void in
            leadListFlag = "1"
            self.leadTableView.reloadData()
        }
        actionSheetController.addAction(activeLeadsAction)
        
        //Create and add a second option action
        let deactivatedLeadsAction: UIAlertAction = UIAlertAction(title: "Deactivated Leads", style: .Default) { action -> Void in
            leadListFlag = "2"
            self.leadTableView.reloadData()
        }
        actionSheetController.addAction(deactivatedLeadsAction)
        
        //We need to provide a popover sourceView when using it on iPad
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView;
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
//*************************************************************************************************************************************************    
    @IBAction func leadTypeButtonTapped(sender: AnyObject) {
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        
        //Create and add first option action
        let allLeadsAction: UIAlertAction = UIAlertAction(title: "All Leads", style: .Default) { action -> Void in
            //Do some other stuff
            leadListFlag = "0"
            
            self.leadTableView.reloadData()
        }
        actionSheetController.addAction(allLeadsAction)
        
        //Create and add first option action
        let activeLeadsAction: UIAlertAction = UIAlertAction(title: "Active Leads", style: .Default) { action -> Void in
            leadListFlag = "1"
            self.leadTableView.reloadData()
        }
        actionSheetController.addAction(activeLeadsAction)
        
        //Create and add a second option action
        let deactivatedLeadsAction: UIAlertAction = UIAlertAction(title: "Deactivated Leads", style: .Default) { action -> Void in
            leadListFlag = "2"
            self.leadTableView.reloadData()
        }
        actionSheetController.addAction(deactivatedLeadsAction)
        
        //We need to provide a popover sourceView when using it on iPad
        actionSheetController.popoverPresentationController?.sourceView = sender as? UIView;
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
//************************************************************************************************************************************************* 
    @IBAction func addLeadButtonTapped(sender: AnyObject) {
        setNewLeadClicked()
    }
    
    @IBAction func newLeadButtonTapped(sender: AnyObject) {
        setNewLeadClicked()
    }
    
    func setNewLeadClicked() {
        newLeadClicked = "yes"
    }
 
//************************************************************************************************************************************************* 
    func fetchLeadList()
    {
        do {
            
            let data = NSData(contentsOfURL: NSURL(string: "http://192.168.1.126:8001/SportsListWS/")!)
            
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            let NumberOfPersons = jsonResult.count
            print(NumberOfPersons)
            
            for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                let personName = anItem["sports_name"] as! String
                print(personName)
                // do something with personName and personID
            }
            
        } catch let error as NSError {
            
            print(error)
            
        }
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
