//
//  InterfaceController.swift
//  WheresMyNearest WatchKit Extension
//
//  Created by Deborah on 2/2/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var table: WKInterfaceTable!
    var places = [String]()
    
    var defaults = UserDefaults(suiteName: "group.com.Deborah.wheresMyNearest")
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "mapInterfaceController", context: nil)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
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
    
    override func willActivate() {
        super.willActivate()
        
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
        
        table.setNumberOfRows(places.count, withRowType: "tableRowController")
        
        for (index, place) in places.enumerated() {
            let row = table.rowController(at: index) as! tableRowController
            row.tableRowLabel.setText(place)
            
            
        }
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    }
