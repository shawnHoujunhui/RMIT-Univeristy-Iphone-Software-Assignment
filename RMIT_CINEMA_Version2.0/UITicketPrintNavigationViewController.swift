//
//  UITicketPrintNavigationViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 16/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class UITicketPrintNavigationViewController: UINavigationController {

    var cinemaTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        
        if segue.identifier == "ticketDetails" {
            if let details = segue.destinationViewController as? TicketPrintViewController {
                let title = cinemaTitle
                
                details.cinemaTitle = title
                
            }
            
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
