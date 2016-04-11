//
//  PersonalDetailsViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class PersonalDetailsViewController: UIViewController {

    
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    
    
    // Once the bar button is clicked Back to home page
    @IBAction func homeBtAction(sender: AnyObject) {
        let homeButton = UIStoryboard(name: "Main", bundle: nil)
        let home = homeButton.instantiateViewControllerWithIdentifier("HomePageViewController")
        self.presentViewController(home,animated:true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailAddress.text = NSUserDefaults.standardUserDefaults().valueForKey("EmailAddress") as! String!
        self.firstname.text = NSUserDefaults.standardUserDefaults().valueForKey("FirstName") as! String!
        self.lastname.text = NSUserDefaults.standardUserDefaults().valueForKey("LastName") as! String!
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Warning - Store the user details in Xcode (Not working Now)
    func changeLabelCont(){
       
        
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
