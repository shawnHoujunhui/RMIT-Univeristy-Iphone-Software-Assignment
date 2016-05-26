//
//  UIphoto.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 15/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit


class UIphoto: UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        self.clipsToBounds=true
      
        self.layer.cornerRadius=self.frame.size.width/2.0
        self.layer.borderWidth=4.0
        self.layer.borderColor=UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.7).CGColor
    }
    
    func onRoation()
    {
        let animation=CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue=0.0
        animation.toValue=M_PI*2.0
        animation.duration=20.0
        animation.repeatCount=10000
        self.layer.addAnimation(animation, forKey: nil)
        
    }
}