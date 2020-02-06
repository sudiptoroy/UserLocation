//
//  ViewController.swift
//  UserLocation
//
//  Created by Sudipto Roy on 2/6/20.
//  Copyright © 2020 Code-X Systems. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // mapView.delegate = self as? MKMapViewDelegate
    }
    
    func setupLocationManager () {
        // setting up location manager delegate
        locationManger.delegate = self
    }
    
    func checkLocationServices () {
        if CLLocationManager.locationServicesEnabled() {
            // Setup location manager
        } else {
            // Show alert to letting the user know they have to turn on the location
        }
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Some code
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Some code
    }
}

