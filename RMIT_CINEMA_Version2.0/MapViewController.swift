//
//  MapViewController.swift
//  RMIT_CINEMA_Version2.0
//
//  Created by JUNHUI HOU on 14/05/2016.
//  Copyright © 2016 RMIT-JunHui Hou. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnFood: UIButton!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnDrink: UIButton!
    @IBOutlet weak var btnHotel: UIButton!
    @IBOutlet weak var btnPolice: UIButton!
    @IBOutlet weak var btnStore: UIButton!
    @IBAction func MenuClick(sender: AnyObject) {
        UIView.animateWithDuration(1,delay:0,options:UIViewAnimationOptions.CurveEaseInOut, animations:{()-> Void in
            self.btnMenu.transform = CGAffineTransformMakeRotation(0)
            self.btnFood.alpha = 0.8
            self.btnFood.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(-80, -5))
            
            
            self.btnLocation.alpha = 0.8
            self.btnLocation.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, -30))
            
            self.btnDrink.alpha = 0.8
            self.btnDrink.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(80, -5))
            
            
            
            self.btnHotel.alpha = 0.8
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(80, -85))
            
            
            self.btnPolice.alpha = 0.8
            self.btnPolice.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, -40))
            
            self.btnStore.alpha = 0.8
            self.btnStore.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(-80, -85))
            
            }, completion:nil)
        
    }
    @IBAction func btnFoodAction(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("coffee bar")
        reset()
    }
    @IBAction func btnLocationAction(sender: AnyObject) {
         mapView.removeAnnotations(mapView.annotations)
        searchMap("RMIT University")
        reset()
    }
    @IBAction func btnDrinkAction(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("shop")
        reset()
    }
    @IBAction func btnHotelAction(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("Hotel")
        reset()
    }
    
    @IBAction func btnPoliceAction(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("Police")
        reset()
    }
    @IBAction func btnStoreAction(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("Store")
        reset()
    }
    //initial location
    let initialLocation = CLLocation(latitude:-37.7796630000,longitude:144.9976860000)
    // set search range
    let searchRadius:CLLocationDistance = 4000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnMenu.alpha = 0
        // set up three optional buttons
        self.btnFood.alpha = 0
        self.btnLocation.alpha = 0
        self.btnDrink.alpha = 0
        self.btnHotel.alpha = 0
        self.btnPolice.alpha = 0
        self.btnStore.alpha = 0
        
        self.btnFood.layer.cornerRadius = 10
        self.btnLocation.layer.cornerRadius = 10
        self.btnDrink.layer.cornerRadius = 10
        self.btnHotel.layer.cornerRadius = 10
        self.btnPolice.layer.cornerRadius = 10
        self.btnStore.layer.cornerRadius = 10
        
        
        
        UIView.animateWithDuration(1,delay:1,options:UIViewAnimationOptions.CurveEaseInOut, animations:{() -> Void in
            self.btnMenu.alpha = 1
            self.btnMenu.transform = CGAffineTransformMakeRotation(2*3.1415927)
            }, completion:nil)
        // Do any additional setup after loading the view.
        
        // create area
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, searchRadius, searchRadius)
        // set up view
        mapView.setRegion(region, animated: true)
        searchMap("place")
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func reset(){
        UIView.animateWithDuration(1,delay:0,options:UIViewAnimationOptions.CurveEaseInOut, animations:{()-> Void in
            self.btnMenu.transform = CGAffineTransformMakeRotation(1*3.1415927)
            self.btnFood.alpha = 0
            self.btnFood.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0,0), CGAffineTransformMakeTranslation(0, 0))
            
            
            self.btnLocation.alpha = 0
            self.btnLocation.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0,0), CGAffineTransformMakeTranslation(0, 0))
            
            self.btnDrink.alpha = 0
            self.btnDrink.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0,0), CGAffineTransformMakeTranslation(0, 0))
            
            self.btnHotel.alpha = 0
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0,0), CGAffineTransformMakeTranslation(0, 0))
            
            self.btnPolice.alpha = 0
            self.btnPolice.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0,0), CGAffineTransformMakeTranslation(0, 0))
            
            self.btnStore.alpha = 0
            self.btnStore.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0,0), CGAffineTransformMakeTranslation(0, 0))
            }, completion:nil)
        
    
    
    }
    // add place details
    func addLocation(title:String, latitude:CLLocationDegrees,longtitude:CLLocationDegrees){
        let location = CLLocationCoordinate2D(latitude:latitude , longitude: longtitude)
        let annotation = MapDetails(coordinate:location, title:title)
        mapView.addAnnotation(annotation)
    }
    
   
    // search places based on current map location
    func searchMap(place:String){
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = place
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center:initialLocation.coordinate, span:span)
        // start research and save the searched data into array
        let search = MKLocalSearch(request:request)
        search.startWithCompletionHandler({(response: MKLocalSearchResponse?, error: NSError?) in
            for item in response!.mapItems {
                self.addLocation(item.name!, latitude:item.placemark.location!.coordinate.latitude, longtitude: item.placemark.location!.coordinate.longitude)
            }
        })

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

 }
}
