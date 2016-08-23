//
//  DashboardViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 09/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var dashboardTableView: UITableView!
    var cellTapped:Bool = false
    var currentRow = -1
    @IBOutlet weak var requestCount: UILabel!
    @IBOutlet weak var leadsCount: UILabel!
    @IBOutlet weak var customerCount: UILabel!
    @IBOutlet weak var appointmentsCount: UILabel!
    @IBOutlet weak var leadView: UIView!
    @IBOutlet weak var customerView: UIView!
    @IBOutlet weak var appointmentView: UIView!
    @IBOutlet weak var requestsView: UIView!
    //declare array of Lead list
    var customerList:[String] = ["Joe Burns", "George Bailey", "Megan Schutt", "Steve Smith", "Adam Voges"]
    
    var customerEmailList:[String] = ["joe.burns@gmail.com", "george.bailey@gmail.com", "megan.schutt@gmail.com", "steve.smith@gmail.com", "adam.voges@gmail.com"]
    
    var customerLoginList:[String] = ["Aug 9, 2016, 8:07 p.m.", "Aug 9, 2016, 7:35 p.m.", "Aug 9, 2016, 7:16 p.m.", "Aug 9, 2016, 6:34 p.m.", "Aug 9, 2016, 5:23 p.m."]
    
    var lineImagesList: [UIImage] = [UIImage(named: "recentLine1.png")!, UIImage(named: "recentLine2.png")!, UIImage(named: "recentLine3.png")!, UIImage(named: "recentLine4.png")!, UIImage(named: "recentLine5.png")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //rounded corners
        leadView.layer.cornerRadius = 5
        customerView.layer.cornerRadius = 5
        appointmentView.layer.cornerRadius = 5
        requestsView.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
        let dashboardColor1 = UIColor(red: 18/255.0, green: 120/255.0, blue: 105/255.0, alpha: 1.0)
        let dashboardColor2 = UIColor(red: 17/255.0, green: 67/255.0, blue: 100/255.0, alpha: 0.50)
        let dashboardColor3 = UIColor(red: 94/255.0, green: 13/255.0, blue: 17/255.0, alpha: 0.20)
        let dashboardColor4 = UIColor(red: 175/255.0, green: 115/255.0, blue: 3/255.0, alpha: 0.50)
        let size: CGFloat = 35.0
        
        //circle for count
        appointmentsCount.bounds = CGRectMake(0.0, 0.0, size, size)
        appointmentsCount.layer.cornerRadius = size/2
        appointmentsCount.layer.borderWidth = 0.0
        appointmentsCount.layer.backgroundColor = dashboardColor3.CGColor
        appointmentsCount.layer.borderColor = dashboardColor3.CGColor
        
        leadsCount.bounds = CGRectMake(0.0, 0.0, size, size)
        leadsCount.layer.cornerRadius = size/2
        leadsCount.layer.borderWidth = 2.0
        leadsCount.layer.backgroundColor = dashboardColor1.CGColor
        leadsCount.layer.borderColor = dashboardColor1.CGColor
        
        customerCount.bounds = CGRectMake(0.0, 0.0, size, size)
        customerCount.layer.cornerRadius = size/2
        customerCount.layer.borderWidth = 0.0
        customerCount.layer.backgroundColor = dashboardColor2.CGColor
        customerCount.layer.borderColor = dashboardColor2.CGColor
        
        requestCount.bounds = CGRectMake(0.0, 0.0, size, size)
        requestCount.layer.cornerRadius = size/2
        requestCount.layer.borderWidth = 0.0
        requestCount.layer.backgroundColor = dashboardColor4.CGColor
        requestCount.layer.borderColor = dashboardColor4.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        dashboardTableView.reloadData()
        
        let cells = dashboardTableView.visibleCells
        let tableHeight: CGFloat = dashboardTableView.bounds.size.height
        
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
        return customerList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dashboardCellData = tableView.dequeueReusableCellWithIdentifier("dashboardCell", forIndexPath: indexPath) as! DashboardTableViewCell
        
        dashboardCellData.dashboardCustomerName.text = customerList[indexPath.row]
        dashboardCellData.dashboardLogin.text = customerLoginList[indexPath.row]
        dashboardCellData.dashboardCustomerEmail.text = customerEmailList[indexPath.row]
        dashboardCellData.dashboardLineImage.image = lineImagesList[indexPath.row]
        
        return dashboardCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       //self.verticalLine.hidden = false
       tableView.allowsMultipleSelection = false
        currentRow = indexPath.row
        print(currentRow)
    }
//*************************************************************************************************************************************************    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
