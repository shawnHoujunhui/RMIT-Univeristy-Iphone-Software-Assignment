//
//  HistoryMovieModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 7/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class HistoryMovieModel: NSObject {
    
    /// override the setValue function
    override func setValue(value: AnyObject?, forUndefinedKey key: String){
        return
    }
    
    // movie name 
    var moviename:String = ""
    // time 
    var time:String = ""
    // price
    var price:String = ""

}
