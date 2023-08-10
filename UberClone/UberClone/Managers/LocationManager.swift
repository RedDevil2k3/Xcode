//
//  LocationManager.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/25/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {  //initialised in UberMapViewRepresentable
    private let locationManager = CLLocationManager()
    static let shared = LocationManager() //creating a shared instance of the location manager to be used by other functions of the app, its kinda like creating an environment object.
    @Published var userLocation: CLLocationCoordinate2D? //published property is for different app instances to look up for it and use it.
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}


//func to grab and updates user's actual location in the app

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //guard !locations.isEmpty else {return}
        guard let location = locations.first else {return}
        self.userLocation = location.coordinate
        //print(locations.first as Any)
        locationManager.stopUpdatingLocation()
    }
}
