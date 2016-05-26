//
//  HistoryModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 20/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class HistoryModel{
    let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
    
    var context: NSManagedObjectContext
        {
        get{
            return appDelegate.managedObjectContext
        }
    }
    
    // Create a collection of objects to store in the database
    var histories = [History]()
    
    func saveHistory(userId: String, movieName:String, price:String, time:String)
    {
        
        let historyEntity =  NSEntityDescription.entityForName("History",
                                                               inManagedObjectContext:context)
        let history = History(entity: historyEntity!,
                              insertIntoManagedObjectContext:context)
        // Create an object based on the Entity
        history.userId = userId
        history.movieName = movieName
        history.price = price
        history.time = time
        histories.append(history)
        updateDatabase()
    }
    
    func getHistories() -> [History]
    {
        do
        {
            let fetchRequest = NSFetchRequest(entityName:"History")
            
            let results =
                try context.executeFetchRequest(fetchRequest)
            histories = results as! [History]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return self.histories
    }
    
    func getHistory(index: Int) -> History
    {
        return histories[index]
    }
    
    
    func updateDatabase()
    {
        do
        {
            try context.save()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    /* This is a class variable allowing me to access it
     without first instantiating the model
     
     Now we can retrieve the model without instantiating it directly
     
     var model = Model.sharedInstance
     */
    
    // Here we use a Struct to hold the instance of the model i.e itself
    private struct Static
    {
        static var instance: HistoryModel?
    }
    
    
    class var sharedInstance: HistoryModel
    {
        if (Static.instance == nil)
        {
            Static.instance = HistoryModel()
        }
        return Static.instance!
    }
    
}
