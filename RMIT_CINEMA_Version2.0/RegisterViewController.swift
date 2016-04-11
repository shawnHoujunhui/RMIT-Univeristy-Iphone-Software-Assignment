//
//  RegisterViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit



class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    // Store personal details
   
    
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
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
    }
    
    
    
    
    // Swap Page (back to main page)
    @IBAction func backButton1(sender: AnyObject) {
        let backButton1 = UIStoryboard(name: "Main", bundle: nil)
        let back1 = backButton1.instantiateViewControllerWithIdentifier("first")
        self.presentViewController(back1,animated:true, completion:nil)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ser the text fields delegate
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        // disable join button
        self.joinButton.disable()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //  Checking the content of textfield
    @IBAction func Validate(sender: AnyObject) {
        if self.firstnameTextField.notEmpty && self.lastnameTextField.notEmpty && self.emailAddressTextField.notEmpty && self.passwordTextField.notEmpty && self.confirmPasswordTextField.notEmpty{
            self.joinButton.enable()
        }else{
            self.joinButton.disable()
        }
    }
    
    
    
    // Validation checking to allow the user view home page
    let FirstName = ""
    let LastName = ""
    let EmailAddress = ""
    @IBAction func joinButtonAction(sender: AnyObject) {
        
        if self.firstnameTextField.validateFirstName() && self.lastnameTextField.validateLastName() && self.emailAddressTextField.validateEmail() &&
            self.passwordTextField.validatePassword() && self.confirmPasswordTextField.validatePassword(){
            let homeButton = UIStoryboard(name: "Main", bundle: nil)
            let home2 = homeButton.instantiateViewControllerWithIdentifier("HomePageViewController")
            self.presentViewController(home2, animated: true, completion: nil)
            
            
            // Warning - Not working now
            // store info
            // create user info
            // set the store information
            NSUserDefaults.standardUserDefaults().setObject(self.firstnameTextField.text, forKey: "FirstName")
            NSUserDefaults.standardUserDefaults().setObject(self.lastnameTextField.text, forKey: "LastName")
            NSUserDefaults.standardUserDefaults().setObject(self.emailAddressTextField.text, forKey: "EmailAddress")
            //set synchronization
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
            
            
            self.alterOne("Thanks for join us")
            
            
        }else if self.lastnameTextField.validateLastName() && self.emailAddressTextField.validateEmail() && self.passwordTextField.validatePassword() && self.passwordTextField.text == self.confirmPasswordTextField.text {
            self.alterOne("Your firstname isn't in the accurate format")
        }else if self.firstnameTextField.validateFirstName() && self.emailAddressTextField.validateEmail() && self.passwordTextField.validatePassword() && self.passwordTextField.text == self.confirmPasswordTextField.text{
            self.alterOne("Your lastname isn't in the accurate format")
        }else if self.firstnameTextField.validateFirstName() && self.lastnameTextField.validateLastName() && self.passwordTextField.validatePassword() && self.passwordTextField.text == self.confirmPasswordTextField.text{
            self.alterOne("Your email address isn't in the accurate format")
        }else if self.firstnameTextField.validateFirstName() && self.lastnameTextField.validateLastName() && self.emailAddressTextField.validateEmail() && self.passwordTextField.text == self.confirmPasswordTextField.text{
            self.alterOne("Your password isn't in the accurate format")
        }else if self.passwordTextField.text != self.confirmPasswordTextField.text{
            self.alterOne("You should input the same password for validation")
        }else {
            self.alterOne("Something wrong!!!")
        }
    }
    
    // pop up window
    func alterOne(message: String){
        let alc = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alc.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alc, animated: true, completion: nil)
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
