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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

   
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnFood: UIButton!
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var btnDrink: UIButton!
    @IBOutlet weak var btnHotel: UIButton!
    @IBOutlet weak var btnPolice: UIButton!
    @IBOutlet weak var btnStore: UIButton!
    
    let locationManager: CLLocationManager = CLLocationManager()
    var myLatitude: CLLocationDegrees!
    var myLongitude: CLLocationDegrees!
    var finalLatitude: CLLocationDegrees!
    var finalLongitude: CLLocationDegrees!
    var distance: CLLocationDistance!
    
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
        // set up monitor for current loation
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MapViewController.action(_:)))
        
        mapView.addGestureRecognizer(tap)
        
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
 
    // update location details
    func action(gestureRecognizer:UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.locationInView(self.mapView)
        let newCoord:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        let getLat: CLLocationDegrees = newCoord.latitude
        let getLon: CLLocationDegrees = newCoord.longitude
        
        //Convert to points to CLLocation. In this way we can measure distanceFromLocation
        let newCoord2: CLLocation = CLLocation(latitude: getLat, longitude: getLon)
        let newCoord3: CLLocation = CLLocation(latitude: myLatitude, longitude: myLongitude)
        
        finalLatitude = newCoord2.coordinate.latitude
        finalLongitude = newCoord2.coordinate.longitude
        print("Original Latitude: \(myLatitude)")
        print("Original Longitude: \(myLongitude)")
        print("Final Latitude: \(finalLatitude)")
        print("Final Longitude: \(finalLongitude)")
        
        //distance between our position and the new point created
        let distance = newCoord2.distanceFromLocation(newCoord3)
        print("Distance between two points: \(distance)")
        
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = newCoord
        newAnnotation.title = "Target Location"
        newAnnotation.subtitle = ""
        mapView.addAnnotation(newAnnotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            if (error != nil) {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            //get data from placemark
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            myLongitude = (containsPlacemark.location!.coordinate.longitude)
            myLatitude = (containsPlacemark.location!.coordinate.latitude)
            
            // testing show data
            print("Locality: \(locality)")
            print("PostalCode: \(postalCode)")
            print("Area: \(administrativeArea)")
            print("Country: \(country)")
            print(myLatitude)
            print(myLongitude)
            
            //update map with my location
            let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.1 , 0.1)
            let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: myLatitude, longitude: myLongitude)
            let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
            mapView.setRegion(theRegion, animated: true)
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    //distance between two points
    func degreesToRadians(degrees: Double) -> Double { return degrees * M_PI / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / M_PI }
    
    func getBearingBetweenTwoPoints1(point1 : CLLocation, point2 : CLLocation) -> Double {
        let lat1 = degreesToRadians(point1.coordinate.latitude)
        let lon1 = degreesToRadians(point1.coordinate.longitude)
        let lat2 = degreesToRadians(point2.coordinate.latitude);
        let lon2 = degreesToRadians(point2.coordinate.longitude);
        
        print("Start latitude: \(point1.coordinate.latitude)")
        print("Start longitude: \(point1.coordinate.longitude)")
        print("Final latitude: \(point2.coordinate.latitude)")
        print("Final longitude: \(point2.coordinate.longitude)")
        
        let dLon = lon2 - lon1;
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        let radiansBearing = atan2(y, x);
        return radiansToDegrees(radiansBearing)
        
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
    
    @IBAction func homeButtonAction(sender: AnyObject) {
        let homeButton = UIStoryboard(name: "Main", bundle: nil)
        let home = homeButton.instantiateViewControllerWithIdentifier("HomePageViewController")
        self.presentViewController(home,animated:true, completion:nil)

    }
}
