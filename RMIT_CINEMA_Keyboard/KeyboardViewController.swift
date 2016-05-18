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
        self.frame = CGRectMake(10,150,100,30)
        self.backgroundColor = UIColor.blueColor()
        
    }
    func enable() {
        self.enabled = true
        self.alpha = 1
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(red:0.02, green:0.48, blue:1, alpha:1)
        self.frame = CGRectMake(10,150,100,30)
        self.backgroundColor = UIColor.blueColor()

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
    func wordaButton(_: AnyObject){
        let number = "a"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordbButton(_: AnyObject){
        let number = "b"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordcButton(_: AnyObject){
        let number = "c"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func worddButton(_: AnyObject){
        let number = "d"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordfButton(_: AnyObject){
        let number = "f"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordgButton(_: AnyObject){
        let number = "g"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordhButton(_: AnyObject){
        let number = "h"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordiButton(_: AnyObject){
        let number = "i"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordjButton(_: AnyObject){
        let number = "j"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordkButton(_: AnyObject){
        let number = "k"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordlButton(_: AnyObject){
        let number = "l"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordmButton(_: AnyObject){
        let number = "m"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordnButton(_: AnyObject){
        let number = "n"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordoButton(_: AnyObject){
        let number = "o"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordpButton(_: AnyObject){
        let number = "p"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordqButton(_: AnyObject){
        let number = "q"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordrButton(_: AnyObject){
        let number = "r"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordyButton(_: AnyObject){
        let number = "y"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordtButton(_: AnyObject){
        let number = "t"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func worduButton(_: AnyObject){
        let number = "u"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordvButton(_: AnyObject){
        let number = "v"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordwButton(_: AnyObject){
        let number = "w"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordxButton(_: AnyObject){
        let number = "x"
        let proxy = self.textDocumentProxy as UIKeyInput
        proxy.insertText(number)
    }
    func wordzButton(_: AnyObject){
        let number = "z"
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
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "e"{
                    w.addTarget(self, action: #selector(teacherButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "@s"{
                    w.addTarget(self, action: #selector(studentAButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "@e"{
                    w.addTarget(self, action: #selector(teacherAButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "0"{
                    w.addTarget(self, action: #selector(number0Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "1"{
                    w.addTarget(self, action: #selector(number1Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "2"{
                    w.addTarget(self, action: #selector(number2Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "3"{
                    w.addTarget(self, action: #selector(number3Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "4"{
                    w.addTarget(self, action: #selector(number4Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "5"{
                    w.addTarget(self, action: #selector(number5Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "6"{
                    w.addTarget(self, action: #selector(number6Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "7"{
                    w.addTarget(self, action: #selector(number7Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "8"{
                    w.addTarget(self, action: #selector(number8Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "9"{
                    w.addTarget(self, action: #selector(number9Button), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "a"{
                    w.addTarget(self, action: #selector(wordaButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "b"{
                    w.addTarget(self, action: #selector(wordbButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "c"{
                    w.addTarget(self, action: #selector(wordcButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "d"{
                    w.addTarget(self, action: #selector(worddButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "f"{
                    w.addTarget(self, action: #selector(wordfButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "g"{
                    w.addTarget(self, action: #selector(wordgButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "h"{
                    w.addTarget(self, action: #selector(wordhButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "i"{
                    w.addTarget(self, action: #selector(wordiButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "j"{
                    w.addTarget(self, action: #selector(wordjButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "k"{
                    w.addTarget(self, action: #selector(wordkButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "l"{
                    w.addTarget(self, action: #selector(wordlButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "m"{
                    w.addTarget(self, action: #selector(wordmButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "n"{
                    w.addTarget(self, action: #selector(wordnButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "o"{
                    w.addTarget(self, action: #selector(wordoButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "p"{
                    w.addTarget(self, action: #selector(wordpButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "q"{
                    w.addTarget(self, action: #selector(wordqButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "x"{
                    w.addTarget(self, action: #selector(wordxButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "y"{
                    w.addTarget(self, action: #selector(wordyButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "z"{
                    w.addTarget(self, action: #selector(wordzButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "r"{
                    w.addTarget(self, action: #selector(wordrButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "t"{
                    w.addTarget(self, action: #selector(wordtButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "u"{
                    w.addTarget(self, action: #selector(worduButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "v"{
                    w.addTarget(self, action: #selector(wordvButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }else if w.currentTitle == "w"{
                    w.addTarget(self, action: #selector(wordwButton), forControlEvents: .TouchDown)
                    w.backgroundColor = UIColor.blackColor()
                    w.layer.cornerRadius = 10
                }
            }
        }
        NSLog("Anything wrong?")
        
    
        
        
        
        
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Change Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        self.nextKeyboardButton.layer.cornerRadius = 10
        self.nextKeyboardButton.backgroundColor = UIColor.whiteColor()
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
