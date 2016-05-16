//
//  TimePickerViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class TimePickerViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, PickerCellsDelegate {
    
    let screentWidth = UIScreen.mainScreen().bounds.size.width
    let screentHeight = UIScreen.mainScreen().bounds.size.height
    var tableSecond:UITableView!
    var secondArray = [String]()
    var footerView:UIView!
    var footerImage:UIButton!
    var goodsSum:UILabel!
    var priceOp:UILabel!
    var priceSum:UILabel!
    var cells : NSDictionary? // Global Variable
    
    
    var isStatus:Bool = false

    
    var fname:String?
    var ftime:String?
    var freleasedate:String?
    var fimage:UIImage?
    
    
    
    @IBOutlet weak var filmname: UILabel!
    @IBOutlet weak var filmtime: UILabel!
    @IBOutlet weak var filmreleasedate: UILabel!
    @IBOutlet weak var filmimage:UIImageView!
    
    
    
    @IBOutlet weak var pickTableView: UITableView!
    
    var pickersController : PickerCellsController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       

        
        filmname.text = fname
        filmtime.text = ftime
        filmreleasedate.text = freleasedate
        filmimage.image = fimage
        
     
        self.filmimage.layer.cornerRadius = 70
        
        self.pickersController = PickerCellsController()
        self.pickersController.attachToTableView(self.pickTableView, tableViewsPriorDelegate: self, withDelegate: self)
        
        let pickerView : CityPickerView = CityPickerView()
        //date and time
        pickerView.initData(pickTableView,pickerC: pickersController,defaultValue: ["Date","Time","AM|PM"])
        
        
        let pickerIP = NSIndexPath(forRow: 0, inSection: 0)
        self.pickersController.addPickerView(pickerView, forIndexPath: pickerIP)
        
        
        tableSecond = UITableView(frame: CGRectMake(0, 465,  screentWidth, screentHeight/3))
        tableSecond.dataSource = self
        tableSecond.delegate = self
        tableSecond.rowHeight = 40
        tableSecond.separatorInset.left = 0
        
        self.view.addSubview(tableSecond)
        tableSecond.registerNib(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "TicketCell")

        self.setTableFooterView(tableSecond)
        footerView = UIView(frame: CGRectMake(0, screentHeight - 50, screentWidth, 50))
        footerView.backgroundColor = UIColor(red: 0.110, green: 0.110, blue: 0.110, alpha: 1)
        self.view.addSubview(footerView)
        
        footerImage = UIButton(frame: CGRectMake(20, 2, 46, 46))
        footerImage.setImage(UIImage(named: "Home_Cart"),forState:.Normal)
        // footerImage.addTarget(self, action: Selector("jumpTicket"), forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(footerImage)
        
        goodsSum = UILabel(frame: CGRectMake(54,2 , 15, 15))
        goodsSum.layer.masksToBounds = true
        goodsSum.layer.cornerRadius = 7.5
        goodsSum.backgroundColor = UIColor.redColor()
        goodsSum.text = "0"
        goodsSum.hidden = true
        goodsSum.textColor = UIColor.whiteColor()
        goodsSum.font = UIFont(name: "Thonburi", size: 13)
        goodsSum.textAlignment = NSTextAlignment.Center
        footerView.addSubview(goodsSum)
        
        priceOp = UILabel(frame: CGRectMake(85, 0, 50, 50))
        priceOp.text = "$"
        priceOp.textColor = UIColor.whiteColor()
        footerView.addSubview(priceOp)
        
        priceSum = UILabel(frame: CGRectMake(100, 0, 50, 50))
        priceSum.text = "0"
        priceSum.textColor = UIColor.whiteColor()
        footerView.addSubview(priceSum)
        
        
        let path = NSBundle.mainBundle().bundlePath
        let plistName:NSString = "TicketsList.plist"
        let finalPath:NSString = (path as NSString).stringByAppendingPathComponent(plistName as String)
        cells = NSDictionary(contentsOfFile:finalPath as String)


    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if (tableView == pickTableView){
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        if let picker : CityPickerView = self.pickersController.pickerForOwnerCellIndexPath(indexPath) as? CityPickerView {
            
            cell.textLabel?.text = picker.getPickerViewResult()
        }else{
            cell.textLabel?.text = ""
        }
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("TicketCell", forIndexPath: indexPath) as! TicketTableViewCell
            let myCell: AnyObject = cells!.objectForKey("cell\(indexPath.row)") as! NSDictionary
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.ticketType.text =  myCell.objectForKey("type") as? String
            cell.ticketPrice.text = myCell.objectForKey("price") as? String
            
            cell.mins.addTarget(self, action: #selector(TimePickerViewController.minus(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            cell.plus.addTarget(self, action: #selector(TimePickerViewController.plus(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            return cell
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector(Selector("setLayoutMargins:")){
            cell.layoutMargins = UIEdgeInsetsZero
        }
        if cell.respondsToSelector(Selector("setSeparatorInset:")){
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell .respondsToSelector(Selector("setPreservesSuperviewLayoutMargins:")){
            cell.preservesSuperviewLayoutMargins = false
        }
    }

    
    //MARK:- PickerCellsDelegate
    
    func pickerCellsController(controller: PickerCellsController!, willExpandTableViewContent tableView: UITableView!, forHeight expandHeight: CGFloat) {
        //        print("expand height =\(expandHeight)")
    }
    
    func pickerCellsController(controller: PickerCellsController!, willCollapseTableViewContent tableView: UITableView!, forHeight expandHeight: CGFloat) {
        //        print(expandHeight)
    }
    func setTableFooterView(tb:UITableView){
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        tb.tableFooterView = view
    }
    
    func minus(sender:UIButton){
        let cell = sender.superview?.superview as! TicketTableViewCell
        if cell.sum.text == "0"{
            return
        }else{
            priceSum.text = "\(Int(priceSum.text!)! - Int(cell.ticketPrice.text!)!)"
            isStatus = false
        }
        if cell.sum.text != "0"{
            cell.sum.text = "\(Int(cell.sum.text!)! - 1)"
        }
        if cell.sum.text == "0"{
            if isStatus{
                return
            }
            goodsSum.text = "\(Int(goodsSum.text!)! - 1)"
            isStatus = true
            if goodsSum.text == "0"{
                goodsSum.hidden = true
            }
        }
    }
    
    func plus(sender:UIButton){
        goodsSum.hidden = false
        let cell = sender.superview?.superview as! TicketTableViewCell
        print(Int(priceSum.text!)!, terminator: "")
        priceSum.text = "\(Int(priceSum.text!)! + Int(cell.ticketPrice.text!)!)"
        if cell.sum.text == "0"{
            goodsSum.text = "\(Int(goodsSum.text!)! + 1)"
            isStatus = false
        }
        cell.sum.text = "\(Int(cell.sum.text!)! + 1)"
    }
//    func jumpTicket(sender:AnyObject){
//        let homeButton = UIStoryboard(name: "Main", bundle: nil)
//        let home = homeButton.instantiateViewControllerWithIdentifier("TicketPrintViewController")
//        self.presentViewController(home,animated:true, completion:nil)
//        self.performSegueWithIdentifier("ticketDetails", sender: self)
//    }
//
//    
    // transform data to print ticket function
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        
        if segue.identifier == "ticketDetails" {
            if let details = segue.destinationViewController as? TicketPrintViewController {
                let title = fname
               
                details.cinemaTitle = title
                
            }
            
        }
    }
    
    
}

