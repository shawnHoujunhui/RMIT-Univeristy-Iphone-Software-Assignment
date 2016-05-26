//
//  CurrentUser.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 18/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import Foundation

class CurrentUser {
    
    var username:String?
    var password:String?
    var firstname:String?
    var lastname:String?
    
    /*
     private constructor
     */
    private struct Static
    {
        static var instance: CurrentUser?
    }
    
    /*
     Create instance and share
     */
    class var sharedInstance: CurrentUser
    {
        if (Static.instance == nil)
        {
            Static.instance = CurrentUser()
        }
        return Static.instance!
    }
}
