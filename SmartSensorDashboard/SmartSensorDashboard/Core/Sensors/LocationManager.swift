//
//  LocationManger.swift
//  SmartSensorDashboard
//
//

import Foundation
import Combine
import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()

    @Published var heading: Double = 0
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func startHeading() {
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.headingAvailable() {
            locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        heading = newHeading.magneticHeading
    }
    
    func directionText(_ heading: Double) -> String {
        switch heading {
        case 0..<45, 315...360: return "North"
        case 45..<135: return "East"
        case 135..<225: return "South"
        case 225..<315: return "West"
        default: return ""
        }
    }

}
