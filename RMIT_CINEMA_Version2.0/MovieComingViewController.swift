//
//  MovieComingViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 28/04/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON

class MovieComingViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var results: NSArray?
    var moviedb:[MovieInfo] = []
    
    
    var refreshControl = UIRefreshControl()
    //create a mutable array
    //var modelArray:NSMutableArray = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        //layoutViewControl()
        super.viewDidLoad()
        
        self.saveMovieData()
        self.loadTable()
        self.table.reloadData()
        
        refreshControl.addTarget(self, action: #selector(MovieComingViewController.refreshData),
                                 forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "refresh")
        table.addSubview(refreshControl)
        refreshData()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    // Warning Issues
    // refresh data
    func refreshData() {
        //remove data
        self.moviedb.removeAll()
        
        self.table.reloadData()
    }
    
    //    func layoutViewControl(){
    //
    //        //register cell
    //        table.registerNib(UINib.init(nibName:"MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "moviecell")
    //        // thake coredata url
    //        let fileUrl = NSBundle.mainBundle().URLForResource("RegisterData", withExtension: "momd")!
    //
    //        let dataArray = NSArray(contentsOfURL: fileUrl)
    //
    //        for dic in dataArray!{
    //            //create object
    //            let dataModel = MovieInfo()
    //
    //            let dictionary: Dictionary<String,AnyObject> = dic as! Dictionary
    //
    //            // data model
    //            dataModel.setValuesForKeysWithDictionary(dictionary)
    //
    //            // add to array
    //            modelArray.addObject(dataModel)
    //
    //        }
    //
    //    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        //        // reuse
        //       let movieCell:MovieTableViewCell =  tableView.dequeueReusableCellWithIdentifier("moviecell", forIndexPath: indexPath) as! MovieTableViewCell
        //        movieCell.selectionStyle = UITableViewCellSelectionStyle.None
        //        let model = modelArray[indexPath.row] as! MovieInfo
        //        movieCell.moviename.text = model.title
        //        movieCell.moviereleasedate.text = model.releaseDate
        //        movieCell.movierunningtime.text = model.runtime
        //        return movieCell
        //
        let cell: MovieComingTableViewCell = tableView.dequeueReusableCellWithIdentifier("moviecell2", forIndexPath: indexPath) as! MovieComingTableViewCell
        let aux = results![indexPath.row] as! NSManagedObject
        cell.moviename!.text = aux.valueForKey("title") as? String
        cell.moviereleasedate!.text = aux.valueForKey("releaseDate") as? String
        cell.movierunningtime!.text = aux.valueForKey("runtime") as? String
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 121;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("showMovieDetails", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        
        
        let indexPath = self.table.indexPathForSelectedRow!
        let title = moviedb[indexPath.row].title
        let company = moviedb[indexPath.row].companies
        //        let country = moviedb[indexPath.row].contries
        let genre = moviedb[indexPath.row].genres
        let status = moviedb[indexPath.row].status
        let releaseDate = moviedb[indexPath.row].releaseDate
        let runningTime = moviedb[indexPath.row].runtime
        
        
        let details = segue.destinationViewController as! ShowMovieDetailsViewController
        details.movieName = title
        details.movieCompanies = company
        //        details.movieCountries = country
        details.movieGenres = genre
        details.movieStatuses = status
        details.movieRunningTime = runningTime
        details.movieReleaseDate = releaseDate
        
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
                    let data = NSEntityDescription.insertNewObjectForEntityForName("MovieInfo", inManagedObjectContext:  context)
                    var dataObj = output["results"][i]
                    let title = dataObj["title"].string ?? ""
                    let overview = dataObj["overview"].string ?? ""
                    let original_language = dataObj["original_language"].string ?? ""
                    let release_date = dataObj["release_date"].string ?? ""
                    let adult = dataObj["adult"].rawString()
                    let id = dataObj["id"].rawString()
                    let poster_path = dataObj["poster_path"].string ?? ""
                    //var genre_ids = dataObj["genre_ids"]
                    data.setValue(id, forKey: "id")
                    data.setValue(adult, forKey: "adult")
                    data.setValue(title, forKey: "title")
                    data.setValue(overview, forKey: "overview")
                    data.setValue(original_language, forKey: "language")
                    data.setValue(release_date, forKey: "releaseDate")
                    data.setValue(poster_path, forKey: "poster")
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