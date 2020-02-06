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
    let regionInMeters: Double = 10000
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // mapView.delegate = self as? MKMapViewDelegate
        checkLocationServices()
    }
    
    func setupLocationManager () {
        // setting up location manager delegate
        locationManager.delegate = self
        
        // Location Accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // function to user's location in zoomed in view
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices () {
        if CLLocationManager.locationServicesEnabled() {
            // Setup location manager
            setupLocationManager()
            // Check Location Authorization
            checkLocationAuthorization()
        } else {
            // Show alert to letting the user know they have to turn on the location
        }
    }
    
    // funtion for checking location authorization
    func checkLocationAuthorization () {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            // Map related code
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .notDetermined:
            // request location authorization when in use
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            // show an alert letting them know what's up
            break
        case .denied:
            // Show the user how to turn on the location
            break
        case .authorizedAlways:
            break
        }
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Check if the user changed the location authorization
        checkLocationAuthorization()
    }
}

