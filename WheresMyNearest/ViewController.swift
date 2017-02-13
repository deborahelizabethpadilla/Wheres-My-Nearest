//
//  ViewController.swift
//  WheresMyNearest
//
//  Created by Deborah on 2/2/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults = UserDefaults(suiteName: "group.com.Deborah.wheresMyNearest")
    
    @IBOutlet var place1: UITextField!
    @IBOutlet var place2: UITextField!
    @IBOutlet var place3: UITextField!
    @IBOutlet var place4: UITextField!
    
    @IBAction func update(_ sender: Any) {
        place1.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var storedPlaces: AnyObject? = defaults?.object(forKey: "places") as AnyObject?
        
        if let storedPlacesArray = storedPlaces as? NSArray {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

