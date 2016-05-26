//
//  LoginViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    let model = FormModel.sharedInstance
    
    // This is called when the user tap the return button on the keyborad
    // Once we tap the return of keyborad, the keyboard will be dismissed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /// This is called when the view sees a touch event
    /// Once we tap outside of the UITextField, the keyborad will be dismissed
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    // back to first page (Welcome page)
    @IBAction func backButton(sender: AnyObject) {
        let backButton = UIStoryboard(name: "Main", bundle: nil)
        let back = backButton.instantiateViewControllerWithIdentifier("first")
        self.presentViewController(back,animated:true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // ser the text fields delegate
        username.delegate = self
        password.delegate = self
        // disable the login button
        model.getForms()
        self.login.disable()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Checking the content of these textfield
    @IBAction func validationChecking(sender: AnyObject) {
        if self.username.notEmpty && self.password.notEmpty{
            self.login.enable()
        }else {
            self.login.disable()
        }
        
    }
    
    // Validation for checking all the textfield
    @IBAction func loginButtonChecking(sender: AnyObject) {
        if self.username.validateEmail() && self.password.validatePassword() && self.username.validateEmailVal() && self.password.validatePasswordVal(self.username.text!){
            // Login to home page
            let homeButton = UIStoryboard(name: "Main", bundle: nil)
            let home1 = homeButton.instantiateViewControllerWithIdentifier("HomePageViewController")
            self.presentViewController(home1, animated: true, completion: nil)
            
        }else if self.username.validateEmail(){
            self.alter("Password isnt Correct")
        }else if self.password.validatePassword(){
            self.alter("Username isnt Correct")
        }else{
            self.alter("Password or Username isnt Correct")
        }
    }
    // pop up window
    func alter(message: String){
        let alc = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alc.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alc, animated: true, completion: nil)
    }
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


