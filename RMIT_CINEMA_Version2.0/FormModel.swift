//
//  FormModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 18/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FormModel{
    let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
    
    var context: NSManagedObjectContext
        {
        get{
            return appDelegate.managedObjectContext
        }
    }
    
    // Create a collection of objects to store in the database
    var forms = [Form]()
    
    func saveForm(emailAddress: String, password:String, firstname:String, lastname:String)
    {
        
        let formEntity =  NSEntityDescription.entityForName("Form",
                                                            inManagedObjectContext:context)
        let form = Form(entity: formEntity!,
                        insertIntoManagedObjectContext:context)
        // Create an object based on the Entity
        form.emailaddress = emailAddress
        form.password = password
        form.firstname = firstname
        form.lastname = lastname
        forms.append(form)
        updateDatabase()
        4    }
    
    func getForms() -> [Form]
    {
        do
        {
            let fetchRequest = NSFetchRequest(entityName:"Form")
            
            let results =
                try context.executeFetchRequest(fetchRequest)
            forms = results as! [Form]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return self.forms
    }
    
    func getForm(index: Int) -> Form
    {
        return forms[index]
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
        static var instance: FormModel?
    }
    
    
    class var sharedInstance: FormModel
    {
        if (Static.instance == nil)
        {
            Static.instance = FormModel()
        }
        return Static.instance!
    }
    
}