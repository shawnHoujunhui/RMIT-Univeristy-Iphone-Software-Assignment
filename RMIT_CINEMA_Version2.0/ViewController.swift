//
//  ViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 6/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//
import UIKit
import CoreData

// extension function for UIButton
extension UIButton {
    func disable() {
        self.enabled = false
        self.alpha = 0.4
    }
    func enable() {
        self.enabled = true
        self.alpha = 1
    }
}

// extension function for UITextField
extension UITextField {
    var notEmpty: Bool{
        get {
            return self.text != ""
        }
    }
    func validate(RegEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluateWithObject(self.text)
    }
    func validateFirstName() -> Bool {
        return self.validate("^[A-Za-z]{1,10}$")
    }
    func validateLastName() -> Bool {
        return self.validate("^[A-Za-z]{2,10}$")
    }
    func validateEmail() -> Bool {
        return self.validate("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
    }
    func validatePassword() -> Bool {
        return self.validate("^[A-Z0-9a-z]{6,18}")
    }
}


class ViewController: UIViewController, UIScrollViewDelegate{
    var scrollView = UIScrollView()
    
    var pageControl = UIPageControl()
    
    var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Welcome Page with 5 images - referenced page
        pageControl.center = CGPointMake(self.view.frame.width/2,self.view.frame.height-30)
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 5
        
        
        
        // Set up UI Scroll frame
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(5*self.view.frame.width, 0)
        
        // Page index
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for i in 0 ..< 5{
            
            let image = UIImage(named: "RMIT_BUILDING\(i+1)")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.view.frame.size.width)
        pageControl.currentPage = index
        if(index == 4){
            self.btn.frame = CGRectMake(4*self.view.frame.width, self.view.frame.height, self.view.frame.width, 70)
            self.btn.setTitle("Enjoy RMIT Cinema", forState: UIControlState.Normal)
            self.btn.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
            self.btn.backgroundColor = UIColor.redColor()
            self.btn.alpha = 0
            self.btn.addTarget(self, action: #selector(ViewController.HomePageButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.btn.frame = CGRectMake(4*self.view.frame.width, self.view.frame.height-160, self.view.frame.width, 50)
                self.btn.alpha = 1
                
                self.scrollView.addSubview(self.btn)
                }, completion: nil)
        }
    }
    // Button Action Event for home page
    func HomePageButton(button: UIButton){
        let firstButton = UIStoryboard(name: "Main", bundle:nil)
        let first = firstButton.instantiateViewControllerWithIdentifier("first")
        self.presentViewController(first, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

