//
//  ViewController.swift
//  WheresMyNearest
//
//  Created by Deborah on 2/2/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var places = [String]()
    
    var defaults = UserDefaults(suiteName: "group.com.Deborah.wheresMyNearest")
    
    @IBOutlet var place1: UITextField!
    @IBOutlet var place2: UITextField!
    @IBOutlet var place3: UITextField!
    @IBOutlet var place4: UITextField!
    
    @IBAction func update(_ sender: Any) {
        places = [place1.text!, place2.text!, place3.text!, place4.text!]
        defaults?.set(places, forKey: "places")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let storedPlaces: AnyObject? = defaults?.object(forKey: "places") as AnyObject?
        
        if let storedPlacesArray = storedPlaces as? NSArray {
            for (index, value) in storedPlacesArray.enumerated() {
                
                if let placeName = value as? String {
                    places.append(placeName)
                    
                }
                
            }
            
        }
        if places.count == 0 {
            places = ["cafe", "cinema", "library", "pub"]
            defaults?.set(places, forKey: "places")
        }
        place1.text = places[0]
        place2.text = places[1]
        place3.text = places[2]
        place4.text = places[3]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

