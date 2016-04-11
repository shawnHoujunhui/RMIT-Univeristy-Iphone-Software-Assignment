//
//  FirstViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // jump to Login page
    @IBAction func YesButton(sender: AnyObject) {
        let yButton = UIStoryboard(name: "Main", bundle: nil)
        let yes = yButton.instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(yes,animated:true, completion:nil)
        
    }
    // jump to register page
    @IBAction func noButton(sender: AnyObject) {
        let nButton = UIStoryboard(name: "Main", bundle: nil)
        let no = nButton.instantiateViewControllerWithIdentifier("Register")
        self.presentViewController(no,animated:true, completion:nil)
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