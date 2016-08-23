//
//  PromotionVehicleListViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 16/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var vehicleBrandPromotionSelected = ""

class PromotionVehicleListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var promotionVehicleBrandTable: UITableView!
    
    var vehicleBrandList:[String] = ["BONLUCK BLK", "DODGE", "HAVAL", "JMC", "LOTUS"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        promotionVehicleBrandTable.contentInset = UIEdgeInsetsZero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        promotionVehicleBrandTable.reloadData()
        //animateTable()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        promotionVehicleBrandTable.reloadData()
        
        let cells = promotionVehicleBrandTable.visibleCells
        let tableHeight: CGFloat = promotionVehicleBrandTable.bounds.size.height
        
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
        return vehicleBrandList.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let leadCellData = tableView.dequeueReusableCellWithIdentifier("vehicleBrandCell", forIndexPath: indexPath) as! VehicleBrandsTableViewCell
        
        leadCellData.vehicleBrandPromotion.text = vehicleBrandList[indexPath.row]
        
        leadCellData.vehicleBrandPromotion.tag = indexPath.row
        
        return leadCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        vehicleBrandPromotionSelected = vehicleBrandList[indexPath.row]
        addPromotionClicked = "no"
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
