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
    
    var places = [String]()
    
    var defaults = UserDefaults(suiteName: "group.com.Deborah.wheresMyNearest")

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
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

    print(places)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    }
