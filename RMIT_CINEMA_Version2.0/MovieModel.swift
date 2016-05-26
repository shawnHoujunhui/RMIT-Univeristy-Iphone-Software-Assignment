//
//  MovieModel.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by Albert Zhu on 19/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import Alamofire
import SwiftyJSON

class MovieModel{
    let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
    
    var context: NSManagedObjectContext
        {
        get{
            return appDelegate.managedObjectContext
        }
    }
    
    // Create a collection of objects to store in the database
    var movies = [MovieInfo]()
    
    func saveMovie(id: String, title:String, overview:String, releaseDate:String, poster:String, adult:String, language:String, genres: String, companies:String, countries:String, runtime:String, status:String)
    {
        
        let movieEntity =  NSEntityDescription.entityForName("MovieInfo",
                                                             inManagedObjectContext:context)
        let movieInfo = MovieInfo(entity: movieEntity!,
                                  insertIntoManagedObjectContext:context)
        // Create an object based on the Entity
        
        movies.append(movieInfo)
        updateDatabase()
        //print("save successfully")
    }
    
    func getMovies() -> [MovieInfo]
    {
        do
        {
            let fetchRequest = NSFetchRequest(entityName:"MovieInfo")
            
            let results =
                try context.executeFetchRequest(fetchRequest)
            movies = results as! [MovieInfo]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return self.movies
    }
    
    func getMovie(index: Int) -> MovieInfo
    {
        return movies[index]
    }
    
    func clearData(){
        for currentMovie in movies{
            context.deleteObject(currentMovie)
        }
        self.updateDatabase()
    }
    
    func saveMovieData(completionHandler:()){
        let mainUrl = "http://image.tmdb.org/t/p/w500"
        
        let urlString = "https://api.themoviedb.org/3/movie/now_playing"
        
        Alamofire.request(.GET, urlString,parameters: ["api_key":"f0851a221cec650a866275a96a9c8a08", "page":"1"]).responseJSON { resp in
            
            
            if let error = resp.result.error{
                print(error)
            }else {
                let value = resp.result.value
                // print(resp)
                print(value)
                
                
                let output = JSON(value!)
                
                // if we get the new data from api
                // delete data in the database then input new datas
                if(output["results"].count > 0){
                    self.clearData()
                    
                    for i in 0...output["results"].count - 1 {
                        var dataObj = output["results"][i]
                        let title = dataObj["title"].string ?? ""
                        let overview = dataObj["overview"].string ?? ""
                        let original_language = dataObj["original_language"].string ?? ""
                        let release_date = dataObj["release_date"].string ?? ""
                        let adult = dataObj["adult"].rawString()
                        let id = dataObj["id"].rawString()
                        var poster_path = dataObj["poster_path"].string ?? ""
                        poster_path = mainUrl + poster_path
                        
                        let detailUrl = "https://api.themoviedb.org/3/movie/" + id!
                        Alamofire.request(.GET, detailUrl, parameters: ["api_key":"f0851a221cec650a866275a96a9c8a08"]).responseJSON{
                            details in
                            
                            print(details)
                            if let error = details.result.error {
                                print(error)
                            }else if details.result.value != nil{
                                let value = details.result.value
                                let details = JSON(value!)
                                var genres = ""
                                if(details["genres"].count>0){
                                    for i in 0...details["genres"].count - 1{
                                        genres += details["genres"][i]["name"].rawString()!
                                        genres += ","
                                    }
                                    genres.removeAtIndex(genres.endIndex.predecessor())
                                }
                                var production_countries = ""
                                if(details["production_countries"].count > 0){
                                    for m in 0...details["production_countries"].count - 1{
                                        production_countries += details["production_countries"][m]["name"].rawString()!
                                        production_countries += ","
                                    }
                                    production_countries.removeAtIndex(production_countries.endIndex.predecessor())
                                }
                                
                                
                                var production_companies = ""
                                if(details["production_companies"].count > 0){
                                    for m in 0...details["production_companies"].count - 1 {
                                        production_companies += details["production_companies"][m]["name"].rawString()!
                                        production_companies += ","
                                    }
                                    production_companies.removeAtIndex(production_companies.endIndex.predecessor())
                                }
                                
                                let status = details["status"].rawString()
                                let runtime = details["runtime"].rawString()
                                
                                self.saveMovie(id!, title: title, overview: overview, releaseDate: release_date, poster: poster_path, adult: adult!, language: original_language, genres: genres, companies: production_companies, countries: production_countries, runtime: runtime!, status: status!)
                                
                            }
                        }
                    }
                    completionHandler
                    
                }
                
            }
        }
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
        static var instance: MovieModel?
    }
    
    
    class var sharedInstance: MovieModel
    {
        if (Static.instance == nil)
        {
            Static.instance = MovieModel()
        }
        return Static.instance!
    }
    
}
