//
//  AreaModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//


import Foundation
import UIKit
class AreaModel : NSObject {
    var cites : NSArray = NSArray()
    var state : String = ""
    
    init(dictionary : NSDictionary){
        let areaCitiesArray : NSMutableArray = NSMutableArray()
        dictionary["cities"]?.enumerateObjectsUsingBlock({
            (dict,idx,stop) in
            
            let areaCitiesModel : AreaCitiesModel = AreaCitiesModel(dict: dict as! NSDictionary)
            areaCitiesArray.addObject(areaCitiesModel)
            
        })
        
        self.cites = areaCitiesArray
        self.state = dictionary["state"] as! String
    }
}
