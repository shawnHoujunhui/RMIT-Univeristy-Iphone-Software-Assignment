//
//  TicketTableViewCell.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 12/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    @IBOutlet weak var ticketType: UILabel!
    @IBOutlet weak var ticketPrice: UILabel!
    @IBOutlet weak var mins: UIButton!
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var plus: UIButton!
    var currentNum:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
//    @IBAction func minsAction(sender: AnyObject) {
//        if(sum.text == "0"){
//            return
//        }
//        currentNum -= 1
//        sum.text = currentNum as? String
//        
//        
//    }
    
//    
//    @IBAction func plusAction(sender: AnyObject) {
//        
//    }
//    
//    func calculatePrice() -> Int {
//        
//    }
}
