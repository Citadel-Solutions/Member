//
//  PromotionVehicleModelListViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 16/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

var vehicleModelPromotionSelected = ""

class PromotionVehicleModelListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var promotionVehicleModelTableView: UITableView!
    
    var vehicleModel: [String] = [String]()
    var bonluckList:[String] = ["JXK6120", "JXK6180"]
    var dodgeList:[String] = ["AVENGER", "CALIBER", "JOURNEY", "NITRO"]
    var havalList:[String] = ["H2", "H8", "H9"]
    var jmcList:[String] = ["VIGUS"]
    var lotusList:[String] = ["ELAN", "ELISE", "ESPRIT", "EUROPA", "EVORA", "EXCEL", "EXIGE"]
    
    var arraySize = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        promotionVehicleModelTableView.contentInset = UIEdgeInsetsZero
        
        if(vehicleBrandPromotionSelected == "BONLUCK BLK") {
            //arraySize = bonluckList.count
            vehicleModel.removeAll()
            
            for i in 0..<bonluckList.count {
                vehicleModel.append(bonluckList[i])
            }
        }
            
        else if(vehicleBrandPromotionSelected == "DODGE") {
            vehicleModel.removeAll()
            vehicleModel = [String]()
            print(vehicleModel.count)
            
            for i in 0..<dodgeList.count {
                vehicleModel.append(dodgeList[i])
            }
        }
            
        else if(vehicleBrandPromotionSelected == "HAVAL") {
            vehicleModel.removeAll()
            vehicleModel = [String]()
            print(vehicleModel.count)
            
            for i in 0..<havalList.count {
                vehicleModel.append(havalList[i])
            }
        }
            
        else if(vehicleBrandPromotionSelected == "JMC") {
            vehicleModel.removeAll()
            vehicleModel = [String]()
            print(vehicleModel.count)
            
            for i in 0..<jmcList.count {
                vehicleModel.append(jmcList[i])
            }
        }
            
        else if(vehicleBrandPromotionSelected == "LOTUS") {
            vehicleModel.removeAll()
            vehicleModel = [String]()
            print(vehicleModel.count)
            
            for i in 0..<lotusList.count {
                vehicleModel.append(lotusList[i])
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //animateTable()
        promotionVehicleModelTableView.reloadData()
    }
    
    //function to Animate the table data on load
    func animateTable() {
        promotionVehicleModelTableView.reloadData()
        
        let cells = promotionVehicleModelTableView.visibleCells
        let tableHeight: CGFloat = promotionVehicleModelTableView.bounds.size.height
        
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
        return vehicleModel.count
    }
    
    //function to assign table data in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let leadCellData = tableView.dequeueReusableCellWithIdentifier("vehicleModelCell", forIndexPath: indexPath) as! VehicleModelsTableViewCell
        
        leadCellData.vehicleModelPromotion.text = vehicleModel[indexPath.row]
        leadCellData.vehicleModelPromotion.tag = indexPath.row
        
        return leadCellData
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        vehicleModelPromotionSelected = vehicleModel[indexPath.row]
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
