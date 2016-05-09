//
//  MovieInfo+CoreDataProperties.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 9/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MovieInfo {

    @NSManaged var id: String?
    @NSManaged var title: String?
    @NSManaged var overview: String?
    @NSManaged var releaseDate: String?
    @NSManaged var poster: String?
    @NSManaged var adult: String?
    @NSManaged var language: String?
    @NSManaged var genres: String?
    @NSManaged var companies: String?
    @NSManaged var contries: String?
    @NSManaged var runtime: String?
    @NSManaged var status: String?
    

}
