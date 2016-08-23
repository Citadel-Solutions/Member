//
//  FeedbackViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 26/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var feedbackTableView: UITableView!
    
    var feedbackCustomerNameList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges", "Sarah Coyte", "Julie Hunter", "Chris Lynn", "Peter Nevill", "Cameron Bancroft", "Delissa Kimmince", "Jackson Bird"]
    
    var feedbackDateList:[String] = ["2016-08-01", "2016-08-01", "2016-08-01", "2016-08-01", "2016-08-01", "2016-08-01", "2016-08-01", "2016-08-01", "2016-08-02", "2016-08-02", "2016-08-02", "2016-08-02"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        feedbackTableView.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        feedbackTableView.reloadData()
        
        let cells = feedbackTableView.visibleCells
        let tableHeight: CGFloat = feedbackTableView.bounds.size.height
        
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
        return feedbackCustomerNameList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let feedbackCellData = tableView.dequeueReusableCellWithIdentifier("feedbackCell", forIndexPath: indexPath) as! FeedbackTableViewCell
        
        feedbackCellData.feedbackCustomerName.text = feedbackCustomerNameList[indexPath.row]
        feedbackCellData.feedbackDate.text = feedbackDateList[indexPath.row]
        
        return feedbackCellData
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.feedbackCustomerNameList.removeAtIndex(indexPath.row)
            self.feedbackTableView.reloadData()
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
