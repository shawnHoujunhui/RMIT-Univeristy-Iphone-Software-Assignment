//
//  HistoryViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 7/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let model = HistoryModel.sharedInstance
    let currentUser = CurrentUser.sharedInstance
    
    // Create a mutable array
    var modelArray:NSMutableArray = []
    
    override func viewDidLoad() {
        layoutViewControl()
        self.model.getHistories()
    }
    func layoutViewControl(){
        
        // register cell
        tableView.registerNib(UINib.init(nibName: "HistoryMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        // take Plist url
        let fileUrl = NSBundle.mainBundle().URLForResource("MovieHistoryList", withExtension: "plist")
        
        let dataArray = NSArray(contentsOfURL: fileUrl!)
        
        for dic in dataArray!{
            // create object
            let dataModel = HistoryMovieModel()
            
            let dictionary:Dictionary<String,AnyObject> = dic as! Dictionary
            
            // data model
            dataModel.setValuesForKeysWithDictionary(dictionary)
            
            // add to array
            modelArray.addObject(dataModel)
            // get data from Coredata and add to array
            
        }
        for history in self.model.histories{
            if history.userId == currentUser.username{
                modelArray.addObject(history)
            }
        }
    }
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1;
//    }
    // cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        // reuse
        let movieCell:HistoryMovieTableViewCell =  tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! HistoryMovieTableViewCell
        if modelArray[indexPath.row] is HistoryMovieModel {
            movieCell.selectionStyle = UITableViewCellSelectionStyle.None
            let ori_model = modelArray[indexPath.row] as! HistoryMovieModel
            movieCell.nameLabel.text = ori_model.moviename
            movieCell.timeLabel.text = ori_model.time
            movieCell.priceLabel.text = ori_model.price
        }else{
            movieCell.selectionStyle = UITableViewCellSelectionStyle.None
            let ori_model = modelArray[indexPath.row] as! History
            movieCell.nameLabel.text = ori_model.movieName
            movieCell.timeLabel.text = ori_model.time
            movieCell.priceLabel.text = ori_model.price
           
        }
        return movieCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 121;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

