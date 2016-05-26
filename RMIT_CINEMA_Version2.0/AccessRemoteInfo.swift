//
//  MovieInfo.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 8/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//


import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class AccessRemoteInfo: NSObject {
    let urlString = "https://api.themoviedb.org/3/movie/now_playing"
    
    func getRemoteData() -> Bool {
        Alamofire.request(.GET, urlString,parameters: ["api_key":"f0851a221cec650a866275a96a9c8a08", "page":"1"]).responseJSON { resp in
            
            
            if let error = resp.result.error{
                print(error)
            }else{
                let value = resp.result.value;
                // print(resp)
                print(value)
                _ = JSON(value!)["books"].array;
                let output = JSON(value!)
                for _ in output["results"]{
                    //var title = dataObj["title"]
                    //var
                }
            }
        }
        return true
    }
}