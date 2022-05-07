//
//  UserLocationManager.swift
//  App
//
//  Created by Владимир on 26.03.2022.
//

import Foundation
import CoreLocation
//create user location
class UserLocationManager : NSObject {
    
    static let shared = UserLocationManager()
    private let locationManager = CLLocationManager()
    private var completition : ((CLLocation)->Void)?
    func getUserLocation(completition : @escaping ((CLLocation)->Void)) {
        self.completition = completition
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension UserLocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locations = locations.first  else {return}
        completition?(locations)
        manager.stopUpdatingLocation()
    }

}
