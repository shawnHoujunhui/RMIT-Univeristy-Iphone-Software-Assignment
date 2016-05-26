//
//  Form+CoreDataProperties.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 20/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Form {

    @NSManaged var emailaddress: String?
    @NSManaged var firstname: String?
    @NSManaged var lastname: String?
    @NSManaged var password: String?

}
