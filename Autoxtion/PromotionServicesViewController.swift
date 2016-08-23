//
//  PromotionServicesViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 17/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var promotionServiceSelected = ""

class PromotionServicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var promotionServiceTable: UITableView!

    var promotionServiceList:[String] = ["Log Book Service", "Full Car Service", "Repairs", "Maintenance", "LPG Installations", "Tyres", "Wheel Alignment", "Air Conditioning Repair & Services", "Auto Electrical Services", "Brakes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        promotionServiceTable.contentInset = UIEdgeInsetsZero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        promotionServiceTable.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        promotionServiceTable.reloadData()
        
        let cells = promotionServiceTable.visibleCells
        let tableHeight: CGFloat = promotionServiceTable.bounds.size.height
        
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
        return promotionServiceList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let promotionServiceCellData = tableView.dequeueReusableCellWithIdentifier("serviceTypeCell", forIndexPath: indexPath) as! PromotionServicesTableViewCell
        
        promotionServiceCellData.promotionServiceType.text = promotionServiceList[indexPath.row]
        
        promotionServiceCellData.promotionServiceType.tag = indexPath.row
        
        return promotionServiceCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        promotionServiceSelected = promotionServiceList[indexPath.row]
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
