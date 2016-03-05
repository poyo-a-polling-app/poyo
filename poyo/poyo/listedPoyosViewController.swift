//
//  listedPoyosViewController.swift
//  poyo
//
//  Created by Takashi Wickes on 3/4/16.
//  Copyright © 2016 Takashi Wickes. All rights reserved.
//

import UIKit
import CoreLocation


class listedPoyosViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var location: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("Location Successful")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            location = nil
        } else {
            print("No location")
        }
        
  
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        latitudeLabel.text = String(format: "%.4f", latestLocation.coordinate.latitude)
        longitudeLabel.text = String(format: "%.4f", latestLocation.coordinate.longitude)
        
        if location == nil {
            location = latestLocation as! CLLocation
        }

    }

    @IBAction func resetLocation(sender: AnyObject) {
        location = nil
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
