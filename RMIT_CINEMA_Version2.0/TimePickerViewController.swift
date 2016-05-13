//
//  TimePickerViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class TimePickerViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, PickerCellsDelegate {
    
    
    
    var fname:String?
    var ftime:String?
    var freleaseDate:String?
    
    @IBOutlet weak var filmname: UILabel!
    @IBOutlet weak var filmtime: UILabel!
    @IBOutlet weak var filmreleasedate: UILabel!
    
    
    
    @IBOutlet weak var pickTableView: UITableView!
    
    var pickersController : PickerCellsController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        filmname.text = fname
        filmtime.text = ftime
        filmreleasedate.text = freleaseDate
        
        self.pickersController = PickerCellsController()
        self.pickersController.attachToTableView(self.pickTableView, tableViewsPriorDelegate: self, withDelegate: self)
        
        let pickerView : CityPickerView = CityPickerView()
        //date and time
        pickerView.initData(pickTableView,pickerC: pickersController,defaultValue: ["Select","Movie","Session"])
        
        
        let pickerIP = NSIndexPath(forRow: 0, inSection: 0)
        self.pickersController.addPickerView(pickerView, forIndexPath: pickerIP)
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        if let picker : CityPickerView = self.pickersController.pickerForOwnerCellIndexPath(indexPath) as? CityPickerView {
            
            cell.textLabel?.text = picker.getPickerViewResult()
        }else{
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK:- PickerCellsDelegate
    
    func pickerCellsController(controller: PickerCellsController!, willExpandTableViewContent tableView: UITableView!, forHeight expandHeight: CGFloat) {
        //        print("expand height =\(expandHeight)")
    }
    
    func pickerCellsController(controller: PickerCellsController!, willCollapseTableViewContent tableView: UITableView!, forHeight expandHeight: CGFloat) {
        //        print(expandHeight)
    }
    
}

