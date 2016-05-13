//
//  AreaFactory.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//



import Foundation

class AreaFactory: NSObject {
    
    class func getAreaArray()->NSArray{
        let path : String = NSBundle.mainBundle().pathForResource("area", ofType: "plist")!
        let resourceArray = NSArray(contentsOfFile: path)
        let modelArray : NSMutableArray = NSMutableArray()
        resourceArray?.enumerateObjectsUsingBlock({
            (item,idx,stop) -> Void in
            
            let model : AreaModel = AreaModel(dictionary: item as! NSDictionary)
            modelArray.addObject(model)
        })
        
        return modelArray
    }
    
}
