//
//  TermsViewController.swift
//  Autoxtion
//
//  Created by citadel soluions on 17/08/2016.
//  Copyright © 2016 citadel soluions. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var termsTextView: UITextView!
    
    let link = "http://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.termsTextView.delegate = self
        self.termsTextView.contentInset = UIEdgeInsetsMake(-40.0, 0, 0, 0)
        
        
        // Do any additional setup after loading the view.
        let text = "When you join AutoXtion, you can access it by any device. I you want to know our terms & conditions, you can do so in About AutoXtion Terms & Conditions."
        let linkTextWithColor = "About AutoXtion Terms & Conditions."
        
        let attributedString = NSMutableAttributedString(string:text)
        let range = (text as NSString).rangeOfString(linkTextWithColor)
        
        
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor() , range: range)
        
        attributedString.addAttributes([NSLinkAttributeName: NSURL(string: "http://portal.autoxtion.com.au/static/pdf/Auto%20Xtion%20Membership%20Agreement-%20Original.pdf")!], range: range)
        
        attributedString.addAttributes([NSFontAttributeName: UIFont.systemFontOfSize(16)], range: NSMakeRange(0, attributedString.length))
        
        self.termsTextView.attributedText = attributedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
//        let webUrl = NSURL(string: link)
//        UIApplication.sharedApplication().openURL(webUrl!)
//        return false
//
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
