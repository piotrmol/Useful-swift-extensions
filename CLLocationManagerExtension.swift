//
//  CoordinateToDegrees.swift
//  GISMO
//
//  Created by Piotr Mol on 28.11.2018.
//  Copyright © 2018 Piotr Mol. All rights reserved.
//

import Foundation


extension CLLocationManager
{
    func getLocationDegreesFrom(latitude: Double) -> String {
        var latSeconds = Int(latitude * 3600)
        let latDegrees = latSeconds / 3600
        latSeconds = abs(latSeconds % 3600)
        let latMinutes = latSeconds / 60
        latSeconds %= 60
        
        return String(
            format: "%d°%d'%d\"%@",
            abs(latDegrees),
            latMinutes,
            latSeconds,
            latDegrees >= 0 ? "N" : "S"
        )
    }
    
    func getLocationDegreesFrom(longitude: Double) -> String {
        var longSeconds = Int(longitude * 3600)
        let longDegrees = longSeconds / 3600
        longSeconds = abs(longSeconds % 3600)
        let longMinutes = longSeconds / 60
        longSeconds %= 60
        
        return String(
            format: "%d°%d'%d\"%@",
            abs(longDegrees),
            longMinutes,
            longSeconds,
            longDegrees >= 0 ? "E" : "W"
        )
    }
    
    /// Sets user location manager before first use
    func prepareUserLocationMenager(followInBackground:Bool = false) {
        self.requestAlwaysAuthorization()
        self.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.desiredAccuracy = kCLLocationAccuracyBest
            self.startUpdatingLocation()
            self.startUpdatingHeading()
            self.distanceFilter = 2
        }
        if followInBackground {
            self.allowsBackgroundLocationUpdates = true
        }
    }

}

extension CLLocationCoordinate2D: Equatable {
    public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return (lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude)
    }
}

