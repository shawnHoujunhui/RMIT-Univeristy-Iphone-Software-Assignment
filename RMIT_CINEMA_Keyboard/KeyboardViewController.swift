//
//  KeyboardViewController.swift
//  RMIT_CINEMA_Keyboard
//
//  Created by JUNHUI HOU on 17/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

extension UIButton {
    func disable() {
        self.enabled = false
        self.alpha = 0.4
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red:0.02, green:0.48, blue:1, alpha:1)
        
    }
    func enable() {
        self.enabled = true
        self.alpha = 1
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red:0.02, green:0.48, blue:1, alpha:1)
        
    }
   

}


class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }
    func studentButton(_: AnyObject){
        let text = "s"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(text)
    }
    func teacherButton(_: AnyObject){
        let text = "e"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(text)
    }
    
    func number1Button(_: AnyObject){
        let number = "1"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number2Button(_: AnyObject){
        let number = "2"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number3Button(_: AnyObject){
        let number = "3"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number4Button(_: AnyObject){
        let number = "4"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number5Button(_: AnyObject){
        let number = "5"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number6Button(_: AnyObject){
        let number = "6"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number7Button(_: AnyObject){
        let number = "7"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number8Button(_: AnyObject){
        let number = "8"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number9Button(_: AnyObject){
        let number = "9"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func number0Button(_: AnyObject){
        let number = "0"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func studentAButton(_: AnyObject){
        let number = "@student.rmit.edu.au"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func teacherAButton(_: AnyObject){
        let number = "@rmit.edu.au"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set up keyboard background
        
        let viewXib = UINib(nibName: "ExtendCustomKeyboard", bundle: nil)
        self.view = viewXib.instantiateWithOwner(self, options: nil)[0] as! UIView;
        for v in self.view.subviews{
            if v.isKindOfClass(UIButton){
                let w = v as! UIButton
                if w.currentTitle == "s"{
                    w.addTarget(self, action: #selector(studentButton), forControlEvents: .TouchDown)
                }else if w.currentTitle == "e"{
                    w.addTarget(self, action: #selector(teacherButton), forControlEvents: .TouchDown)
                }else if w.currentTitle == "@s"{
                    w.addTarget(self, action: #selector(studentAButton), forControlEvents: .TouchDown)
                }else if w.currentTitle == "@e"{
                    w.addTarget(self, action: #selector(teacherAButton), forControlEvents: .TouchDown)
                }else if w.currentTitle == "0"{
                    w.addTarget(self, action: #selector(number0Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "1"{
                    w.addTarget(self, action: #selector(number1Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "2"{
                    w.addTarget(self, action: #selector(number2Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "3"{
                    w.addTarget(self, action: #selector(number3Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "4"{
                    w.addTarget(self, action: #selector(number4Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "5"{
                    w.addTarget(self, action: #selector(number5Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "6"{
                    w.addTarget(self, action: #selector(number6Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "7"{
                    w.addTarget(self, action: #selector(number7Button), forControlEvents: .TouchDown)
                }else if w.currentTitle == "8"{
                    w.addTarget(self, action: #selector(number8Button), forControlEvents: .TouchDown)
                }else{
                    w.addTarget(self, action: #selector(number9Button), forControlEvents: .TouchDown)
                }
            }
            
        }
        NSLog("Anything wrong?")
        
    
        
        
        
        
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyboardButton.addTarget(self, action: #selector(advanceToNextInputMode), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
