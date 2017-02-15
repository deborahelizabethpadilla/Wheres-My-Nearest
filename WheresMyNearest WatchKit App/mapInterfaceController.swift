//
//  mapInterfaceController.swift
//  WheresMyNearest
//
//  Created by Deborah on 2/12/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit
import WatchKit

class mapInterfaceController: WKInterfaceController {
    
    var latitude:Double = 0
    var longitude:Double = 0
    
    var placeName = ""
    
    override func willActivate() {
        let url = NSURL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&types=food&name=cruise&key=AIzaSyDVQdPf1UBH6sbLmCtsRWoRIgsouboYeRo")
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error == nil {
                var jsonResult: NSDictionary = JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions) as NSDictionary
                
                print(jsonResult)
                
                let returnedPlaces: NSArray? = jsonResult
                
                if returnedPlaces != nil {
                    if let returnedPlace = returnedPlaces?[0] as? NSDictionary {
                        
                        if let geometry = returnedPlace["geometry"] as? NSDictionary {
                            
                            if let name = returnedPlace["name"] as? NSString {
                                
                                self.placeName = name as String
                                
                            }
                            
                            if let location = geometry["location"] as? NSDictionary {
                                
                                if let lat = location["lat"] as? Double {
                                    
                                    self.latitude = lat
                                }
                                if let lng = location["lng"] as? Double {
                                    
                                    self.longitude = lng
                                }
                            }
                        }
                    }
                }
                
            } else {
                print(error)
            }
            
            if self.latitude != 0 && self.longitude != 0 && self.placeName != "" {
                let location = CLLocationCoordinate2D(latitude: self.latitude as CLLocationDegrees, longitude: self.longitude as CLLocationDegrees)
                
                let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                
                let region = MKCoordinateRegion(center: location, span: span)
            }
        }
        task.resume()
    }
    
}
