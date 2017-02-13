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

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

    
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
