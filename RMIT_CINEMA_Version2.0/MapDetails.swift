//
//  MapDetails.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 14/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit
import MapKit

class MapDetails: NSObject,MKAnnotation {
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0,0)
    var title:String!
    init(coordinate:CLLocationCoordinate2D,title:String){
        self.coordinate = coordinate
        self.title = title
    }
    
}
