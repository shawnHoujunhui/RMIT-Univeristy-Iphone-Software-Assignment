//
//  TicketPrintViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 16/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class TicketPrintViewController: UIViewController {

    var cinemaImage: UIImage?
    var cinemaTitle: String?
    var cinemaRunning: String?
    var cinemaReleaseDate: String?
    var cinemaTotalPrice: String?
    
    @IBOutlet weak var ctitle: UILabel!
    @IBOutlet weak var crunning: UILabel!
    @IBOutlet weak var creleasedate: UILabel!
    @IBOutlet weak var cimage: UIImageView!
    
    @IBOutlet weak var ctotalprice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ctitle.text = cinemaTitle
        crunning.text = cinemaRunning
        creleasedate.text = cinemaReleaseDate
        cimage.image = cinemaImage
        ctotalprice.text = cinemaTotalPrice
        

        // Do any additional setup after loading the view.
    }

    @IBAction func CoreMapAction(sender: AnyObject) {
        let homeButton = UIStoryboard(name: "Main", bundle: nil)
        let home = homeButton.instantiateViewControllerWithIdentifier("MapViewController")
        self.presentViewController(home,animated:true, completion:nil)

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
