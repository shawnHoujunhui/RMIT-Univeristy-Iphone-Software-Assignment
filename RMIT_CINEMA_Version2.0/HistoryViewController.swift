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
    
    // Create a mutable array
    var modelArray:NSMutableArray = []
    
    override func viewDidLoad() {
        layoutViewControl()
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
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    // cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        // reuse
        let movieCell:HistoryMovieTableViewCell =  tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! HistoryMovieTableViewCell
        movieCell.selectionStyle = UITableViewCellSelectionStyle.None
        let model = modelArray[indexPath.row] as! HistoryMovieModel
        movieCell.nameLabel.text = model.moviename
        movieCell.timeLabel.text = model.time
        movieCell.priceLabel.text = model.price
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

