//
//  FeedbackViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var messageAreaTextField: UITextView!
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
        firstnameTextField.resignFirstResponder()
        lastnameTextField.resignFirstResponder()
        emailAddressTextField.resignFirstResponder()
        messageAreaTextField.resignFirstResponder()
        
    }
   
    
    // Checking the content of these textfield 
    @IBAction func ValidationCheckingAction(sender: AnyObject) {
        // If the content of these textfields are not empty -> enable the submit Button, otherwise disable the submit button
        if self.firstnameTextField.notEmpty && self.emailAddressTextField.notEmpty{
            self.submitButton.enable()
        }else{
            self.submitButton.disable()
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // close keyboard
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        emailAddressTextField.delegate = self
        messageAreaTextField.delegate = self
        
        // add placeholder function for textview
        messageAreaTextField.delegate = self
        messageAreaTextField.text = "Message Area Enter here..."
        messageAreaTextField.textColor = UIColor.grayColor()
        
        // Do any additional setup  after loading the view.
    }
    
    // Add this functionality into textView
    // 1. change the text font color
    // 2. change the content of textView to empty
    func textViewDidBeginEditing(textView: UITextView){
        if messageAreaTextField.textColor == UIColor.grayColor(){
            messageAreaTextField.text = ""
            messageAreaTextField.textColor = UIColor.whiteColor()
        }
    }
    
    // Add this functionality into textView
    // 1. Checking the content of messageAreaTextField
    // If it is empty
    // 2. Change the content of textView to "Message area enter here"
    // 3. Change the textColor to gray color
    func textViewDidEndEditing(textView: UITextView) {
        if messageAreaTextField.text == "" {
            messageAreaTextField.text = "Message Area Enter here..."
            messageAreaTextField.textColor = UIColor.grayColor()
        }
    }
    
    // pop up window
    func alterOne(message: String){
        let alc = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alc.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alc, animated: true, completion: nil)
    }
    
    // Validation for all the below textfield
    @IBAction func submitButtonAction(sender: AnyObject) {
        if self.firstnameTextField.validateFirstName() && self.lastnameTextField.validateLastName() && self.emailAddressTextField.validateEmail(){
                self.alterOne("Thanks for your feedback")
        }else if !self.firstnameTextField.validateFirstName(){
            self.alterOne("Your first name is not accurate")
        }else if !self.lastnameTextField.validateLastName(){
            self.alterOne("Your last name is not accurate")
        }else if !self.emailAddressTextField.validateEmail(){
            self.alterOne("Your email address is not accurate")
        }else{
            self.alterOne("Something Wrong!!!")
        }
        
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
