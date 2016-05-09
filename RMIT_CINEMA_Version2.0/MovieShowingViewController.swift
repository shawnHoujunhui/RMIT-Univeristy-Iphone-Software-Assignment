//
//  MovieShowingViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 28/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON

class MovieShowingViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var results: NSArray?
    var moviedb:[MovieInfo] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        self.saveMovieData()
        self.loadTable()
        self.table.reloadData()

       
        // Do any additional setup after loading the view.
        
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        let aux = results![indexPath.row] as! NSManagedObject
        cell.textLabel!.text = aux.valueForKey("id") as? String
        var str = aux.valueForKey("poster") as? String
        str = "http://image.tmdb.org/t/p/w500" + str!
        cell.textLabel!.text = str
        cell.detailTextLabel!.text = aux.valueForKey("runtime") as? String
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return "Contacts"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadTable(){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "MovieInfo")
        request.returnsObjectsAsFaults = false
        results = try? context.executeFetchRequest(request)
        moviedb = results as! [MovieInfo]
        print(moviedb)
    }
    
    func saveMovieData(){
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let urlString = "https://api.themoviedb.org/3/movie/now_playing"
        var dataArray = [NSManagedObject]()
        Alamofire.request(.GET, urlString,parameters: ["api_key":"f0851a221cec650a866275a96a9c8a08", "page":"1"]).responseJSON { resp in
            
            
            if let error = resp.result.error{
                print(error)
            }else {
                let value = resp.result.value
                // print(resp)
                print(value)
                
                let output = JSON(value!)
                for i in 0...output["results"].count - 1 {
                    var data = NSEntityDescription.insertNewObjectForEntityForName("MovieInfo", inManagedObjectContext:  context)
                    var dataObj = output["results"][i]
                    var title = dataObj["title"].string ?? ""
                    var overview = dataObj["overview"].string ?? ""
                    var original_language = dataObj["original_language"].string ?? ""
                    var release_date = dataObj["release_date"].string ?? ""
                    var adult = dataObj["adult"].rawString()
                    var id = dataObj["id"].rawString()
                    var poster_path = dataObj["poster_path"].string ?? ""
                    //var genre_ids = dataObj["genre_ids"]
                    data.setValue(id, forKey: "id")
                    data.setValue(adult, forKey: "adult")
                    data.setValue(title, forKey: "title")
                    data.setValue(overview, forKey: "overview")
                    data.setValue(original_language, forKey: "language")
                    data.setValue(release_date, forKey: "releaseDate")
                    data.setValue(poster_path, forKey: "poster")
                    let detailUrl = "https://api.themoviedb.org/3/movie/290595"
                    Alamofire.request(.GET, detailUrl, parameters: ["api_key":"f0851a221cec650a866275a96a9c8a08"]).responseJSON{
                        details in
                        
                        print(details)
                        if let error = details.result.error {
                            print(error)
                        }else if details.result.value != nil{
                            let value = details.result.value
                            let details = JSON(value!)
                            var genres = ""
                            for i in 0...details["genres"].count - 1{
                                genres += details["genres"][i]["name"].rawString()!
                                genres += ","
                            }
                            genres.removeAtIndex(genres.endIndex.predecessor())
                            var production_countries = ""
                            for m in 0...details["production_countries"].count - 1{
                                production_countries += details["production_countries"][m]["name"].rawString()!
                                production_countries += ","
                            }
                            production_countries.removeAtIndex(production_countries.endIndex.predecessor())
                            
                            var production_companies = ""
                            for m in 0...details["production_companies"].count - 1 {
                                production_companies += details["production_companies"][m]["name"].rawString()!
                                production_companies += ","
                            }
                            production_companies.removeAtIndex(production_companies.endIndex.predecessor())
                            var status = details["status"].rawString()
                            var runtime = details["runtime"].rawString()
                            data.setValue(genres, forKey:  "genres")
                            data.setValue(production_countries, forKey: "countries")
                            data.setValue(production_companies, forKey: "companies")
                            data.setValue(status, forKey: "status")
                            data.setValue(runtime, forKey: "runtime")
                            
                            dataArray.append(data)
                            
                            if(i == output["results"].count - 1){
                                do{
                                    try context.save()
                                }catch{
                                
                                }
                                self.loadTable()
                                self.table.reloadData()
                            }
                            
                        }
                    }
                    
                }
                
            }
        }
    }
}