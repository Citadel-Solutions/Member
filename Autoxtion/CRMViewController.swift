//
//  CRMViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 26/07/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class CRMViewController: UIViewController {
    @IBOutlet weak var leadView: UIView!
    @IBOutlet weak var customerView: UIView!
    @IBOutlet weak var crmSegmentedControl: UISegmentedControl!
    @IBOutlet weak var newLeadButton: UIBarButtonItem!
    //declare array of Lead list
    var leadList:[String] = ["abc", "xyz", "abc", "xyz", "abc", "xyz", "abc", "xyz", "abc", "xyz", "abc", "xyz", "abc", "xyz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (generateCredentialFlag == "1") {
            crmSegmentedControl.selectedSegmentIndex = 1
            generateCredentialFlag = "0"
            
            self.leadView.hidden = true
            self.customerView.hidden = false
        }
        else {
            self.leadView.hidden = false
            self.customerView.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //segment change as per selected segment
    @IBAction func crmSegmentControlChange(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("case 0")
            self.leadView.hidden = false
            self.customerView.hidden = true
            break
            
        case 1:
            print("case 1")
            self.leadView.hidden = true
            self.customerView.hidden = false
            break
            
        default:
            print("error")
            break
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
