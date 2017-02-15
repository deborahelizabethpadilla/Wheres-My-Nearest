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
                                
                                print(name)
                            }
                            
                            if let location = geometry["location"] as? NSDictionary {
                                
                                if let lat = location["lat"] as? Double {
                                    
                                    print(lat)
                                }
                                if let lng = location["lng"] as? Double {
                                    
                                    print(lng)
                                }
                            }
                        }
                    }
                }
                
            } else {
                print(error)
            }
        }
        task.resume()
    }
    
}
