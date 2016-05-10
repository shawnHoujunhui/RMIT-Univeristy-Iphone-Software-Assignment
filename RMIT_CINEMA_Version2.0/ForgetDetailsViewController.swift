//
//  ForgetDetailsViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class ForgetDetailsViewController: UIViewController , UITextFieldDelegate{
    
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    // This is called when the user tap the return button on the keyborad
    // Once we tap the return of keyborad, the keyboard will be dismissed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /// This is called when the view sees a touch event
    /// Once we tap outside of the UITextField, the keyborad will be dismissed
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        firstname.resignFirstResponder()
        emailAddress.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ser the text fields delegate
        firstname.delegate = self
        emailAddress.delegate = self
        // disable the submit button
        self.submitButton.disable()
     
        // Do any additional setup after loading the view.
    }

    
    // Lock the submit button or open the submit button
    // Check the content of firstname textfield
    // Check the content of emailAddress textfield
    @IBAction func validationChecking(sender: AnyObject) {
        // If the content of these textfields are not empty -> enable the submit Button, otherwise disable the submit button
        if self.firstname.notEmpty && self.emailAddress.notEmpty{
            self.submitButton.enable()
        }else{
            self.submitButton.disable()
        }
    }
    
    // Validation checking to allow the user submit their request and pop up a reminder window
    @IBAction func submitButtonAction(sender: AnyObject) {
        if self.firstname.validateFirstName() && self.emailAddress.validateEmail(){
            self.alterOne("Please Check your registered email ")
        }else if !self.firstname.validateFirstName(){
            self.alterOne("Your first is not accurate")
        }else if !self.emailAddress.validateEmail(){
            self.alterOne("Your email address is not accurate")
        }else{
            self.alterOne("Something Wrong!!!")
        }
    }
      
    
    
    // pop up window
    func alterOne(message: String){
        let alc = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alc.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
