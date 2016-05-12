//
//  TicketModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 12/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class TicketModel: NSObject {
    /// override the setValue function
    override func setValue(value: AnyObject?, forUndefinedKey key: String){
        return
    }

    
    var mtype: String = ""
    var mprice: Double = 0.00
    var msum: Double = 0.00
    
}
