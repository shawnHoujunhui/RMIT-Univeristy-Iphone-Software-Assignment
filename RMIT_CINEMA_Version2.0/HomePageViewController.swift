//
//  HomePageViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    
    // Change to help page
    @IBAction func helpPageAction(sender: AnyObject) {
        // allow the user view help page
        let help = UIStoryboard(name: "Main", bundle: nil)
        let helpButton = help.instantiateViewControllerWithIdentifier("HelpPageViewController")
        self.presentViewController(helpButton,animated:true, completion:nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
