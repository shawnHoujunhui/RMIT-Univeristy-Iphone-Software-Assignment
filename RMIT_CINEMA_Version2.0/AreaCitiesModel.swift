//
//  AreaCitiesModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//


import Foundation
class AreaCitiesModel : NSObject{
    var areas : NSArray = NSArray()
    var state : String = ""
    init(dict : NSDictionary){
        if let stateStr : String = dict["state"] as? String{
            self.state = stateStr
        }
        
        if let areaArr : NSArray = dict["areas"] as? NSArray {
            self.areas = areaArr
        }
    }
}