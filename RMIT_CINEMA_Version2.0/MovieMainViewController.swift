//
//  MovieMainViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 28/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, al: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: al)
    }
    
    convenience init(netHex:Int, alpha: CGFloat) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, al: alpha)
    }
}

func storyboardMain<T>(identifier:String) -> T
{
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(identifier) as! T;
}

let CFSLogoColorBlue = 0x00AAEE

class MovieMainViewController: UIViewController {
    
    // Button Selected Color
    let selectedColor = UIColor.redColor()
    
    // Button not selected color
    let unSelectedColor = UIColor.grayColor()
    
    // Button space
    let distanceBetweenButton:CGFloat = 10.0
    
    // The selected UIButton
    var currentTag:Int!
    // The selected ViewController
    var currentVC:UIViewController!
    
    let firstVC:MovieShowingViewController = storyboardMain("MovieShowingViewController")
    let secondVC:MovieHotViewController = storyboardMain("MovieHotViewController")
    let threeVC:MovieComingViewController = storyboardMain("MovieComingViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavTitleView()
        setupChildViewControllers()
    }
    
    func setupNavTitleView(){
        let titleView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width*0.65, 30))
        
        let hotButton = UIButton(type: .Custom)
        
        hotButton.frame = CGRectMake(self.view.frame.width/2 - 50, 100, 100, 100)
        hotButton.selected = true
        hotButton.titleLabel?.font = UIFont.systemFontOfSize(10.0)
        hotButton.setTitle("Now Showing", forState: .Normal)
        hotButton.setTitleColor(unSelectedColor, forState:.Normal)
        hotButton.setTitleColor(selectedColor, forState: .Selected)
        hotButton.addTarget(self, action: #selector(MovieMainViewController.didClickSelectButton(_:)), forControlEvents: .TouchUpInside)
        hotButton.tag = 0
        currentTag = hotButton.tag
        titleView.addSubview(hotButton)
        
        let latestButton = UIButton(type: .Custom)
        latestButton.setTitle("What's Hot", forState: .Normal)
        latestButton.titleLabel?.font = UIFont.systemFontOfSize(10.0)
        latestButton.setTitleColor(unSelectedColor, forState: .Normal)
        latestButton.setTitleColor(selectedColor, forState: .Selected)
        latestButton.addTarget(self, action: #selector(MovieMainViewController.didClickSelectButton(_:)), forControlEvents: .TouchUpInside)
        latestButton.tag = 1
        titleView.addSubview(latestButton)
        
        let attentionButton = UIButton(type: .Custom)
        attentionButton.titleLabel?.font = UIFont.systemFontOfSize(10.0)
        attentionButton.setTitle("Coming Soon", forState: .Normal)
        attentionButton.setTitleColor(unSelectedColor, forState: .Normal)
        attentionButton.setTitleColor(selectedColor, forState: .Selected)
        attentionButton.addTarget(self, action: #selector(MovieMainViewController.didClickSelectButton(_:)), forControlEvents: .TouchUpInside)
        attentionButton.tag = 2
        titleView.addSubview(attentionButton)
        
        // x location
        let underLineViewX:CGFloat = (titleView.frame.size.width - distanceBetweenButton * 2) / 3
        let underLineView = UIView(frame: CGRectMake(0, titleView.frame.size.height,underLineViewX , 2))
        underLineView.backgroundColor = UIColor(netHex: CFSLogoColorBlue, alpha: 1.0)
        underLineView.tag = 3
        titleView.addSubview(underLineView)
        
        hotButton.translatesAutoresizingMaskIntoConstraints = false
        latestButton.translatesAutoresizingMaskIntoConstraints = false
        attentionButton.translatesAutoresizingMaskIntoConstraints = false
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        
        var vfls = [String]()
        let hot_V = "V:|-0-[hotButton]-0-|"
        let hot_H = "H:|-0-[hotButton]"
        let latest_V = "V:|-0-[latestButton]-0-|"
        let latest_H = "[hotButton]-distance-[latestButton(==hotButton)]"
        let attention_V = "V:|-0-[attentionButton]-0-|"
        let attention_H = "[latestButton]-distance-[attentionButton(==hotButton)]"
        
        vfls.append(hot_V)
        vfls.append(hot_H)
        vfls.append(latest_V)
        vfls.append(latest_H)
        vfls.append(attention_V)
        vfls.append(attention_H)
        
        titleView.addConstraint(NSLayoutConstraint(item: hotButton, attribute: .Width, relatedBy: .Equal, toItem: titleView, attribute: .Width, multiplier:0.34, constant: -distanceBetweenButton))
        
        for vfl in vfls {
            titleView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(vfl, options: NSLayoutFormatOptions.AlignAllBaseline, metrics: ["tHeight":titleView.frame.size.height,"distance":distanceBetweenButton], views: ["hotButton":hotButton,"latestButton":latestButton,"attentionButton":attentionButton]))
        }
        titleView.setNeedsUpdateConstraints()
        
        self.navigationItem.titleView = titleView
    }
    
    func setupChildViewControllers(){
        self.addChildViewController(firstVC)
        self.addChildViewController(secondVC)
        self.addChildViewController(threeVC)
        
       
        self.view.addSubview(firstVC.view)
        self.currentVC = firstVC
        
        let views = ["vc0":firstVC.view]
        let vc0_V = "V:|-0-[vc0]-0-|"
        let vc0_H = "H:|-0-[vc0]-0-|"
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(vc0_V, options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(vc0_H, options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: views))
        self.view.setNeedsUpdateConstraints()
    }
    
    func didClickSelectButton(sender:UIButton){
        // Function avoid double click
        if sender.selected && sender.tag == currentTag  {
            return
        }
        sender.selected = !sender.selected
        currentTag = sender.tag
        
        var underLineView : UIView!
        
        if let subviews = sender.superview?.subviews {
            for v in subviews {
                if let button = v as? UIButton where button.tag != sender.tag {
                    button.selected = false
                }
                
                if v.tag == 3 {
                    underLineView = v
                }
            }
        }
        
        let everyButtonWidth:CGFloat = (sender.superview!.frame.size.width - distanceBetweenButton * 2) / 3
        let underLineViewX0:CGFloat = 0
        let underLineViewX1:CGFloat = everyButtonWidth + distanceBetweenButton
        let underLineViewX2:CGFloat = everyButtonWidth * 2 + distanceBetweenButton * 2
        
        switch sender.tag {
        case 0:
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                underLineView.frame.origin.x = underLineViewX0
            })
            replaceController(currentVC, newVC: firstVC)
            break
        case 1:
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                underLineView.frame.origin.x = underLineViewX1
            })
            replaceController(currentVC, newVC: secondVC)
            break
        case 2:
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                underLineView.frame.origin.x = underLineViewX2
            })
            replaceController(currentVC, newVC: threeVC)
            break
        default:break
        }
        
    }
    
    func replaceController(oldVC:UIViewController,newVC:UIViewController){
        self.addChildViewController(newVC)
        
        
        self.transitionFromViewController(oldVC, toViewController: newVC, duration: 0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil) { (finished) -> Void in
            if finished {
                newVC.didMoveToParentViewController(self)
                oldVC.willMoveToParentViewController(nil)
                oldVC.removeFromParentViewController()
                self.currentVC = newVC
            }else{
                self.currentVC = oldVC
            }
        }
    }
    
}
