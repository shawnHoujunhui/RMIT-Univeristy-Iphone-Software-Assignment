//
//  PersonalDetailsInfoProcessor.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 7/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class PersonalDetailsInfoProcessor: NSObject {
  /*  static func createPlist(fileName:String){
        let dict = NSDictionary.init(object: "plist", forKey: "users")
        // current filename path
        let path = "./"+fileName+".plist"
        dict.writeToFile(path, atomically: true)
    }
    */
    var firstname: String?
    var lastname: String?
    var emailAddress: String?
    var password: String?
}
