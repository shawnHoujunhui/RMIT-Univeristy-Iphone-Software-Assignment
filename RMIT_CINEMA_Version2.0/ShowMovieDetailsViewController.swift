//
//  ShowMovieDetailsViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 11/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit

class ShowMovieDetailsViewController: UIViewController{
    

    var movieName:String?
    var movieCompanies:String?
//    var movieCountries:String?
    var movieGenres:String?
    var movieStatuses:String?
    var movieReleaseDate:String?
    var movieRunningTime:String?
    var movieoverview:String?
    var movieimage:UIImage?
    

    @IBOutlet weak var mtitle: UILabel!
    @IBOutlet weak var mcompany: UILabel!
//    @IBOutlet weak var mcountry: UILabel!
    @IBOutlet weak var mgenre: UILabel!
    @IBOutlet weak var mstatus: UILabel!
    @IBOutlet weak var mreleasedate: UILabel!
    @IBOutlet weak var mrunningtime: UILabel!
    @IBOutlet weak var mdesc:UITextView!
    @IBOutlet weak var mimage:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        mtitle.text = movieName
        mcompany.text = movieCompanies
//        mcountry.text = movieCountries
        mgenre.text = movieGenres
        mstatus.text = movieStatuses
        mreleasedate.text = movieReleaseDate
        mrunningtime.text = movieRunningTime
        mdesc.text = movieoverview
        mimage.image = movieimage
        // Do any additional setup after loading the view.
    }
    
  
  
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        
        if segue.identifier == "showFilmDetails" {
            if let details = segue.destinationViewController as? TimePickerViewController {
                let title = movieName
                let runningTime = movieRunningTime
                let releaseDate = movieReleaseDate
                let image = movieimage
                details.fname = title
                details.ftime = runningTime
                details.fimage = image
                details.freleasedate = releaseDate
            
            }
        
        }
        
//        let company = moviedb[indexPath.row].companies
//        //        let country = moviedb[indexPath.row].contries
//        let genre = moviedb[indexPath.row].genres
//        let status = moviedb[indexPath.row].status
//        let releaseDate = moviedb[indexPath.row].releaseDate
        
//        let overview = moviedb[indexPath.row].overview
        
//        let details = segue.destinationViewController as! TimePickerViewController
        
//        details.movieCompanies = company
//        //        details.movieCountries = country
//        details.movieGenres = genre
//        details.movieStatuses = status
        
//        details.movieReleaseDate = releaseDate
//        details.movieoverview = overview
        
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

}
