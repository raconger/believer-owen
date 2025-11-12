import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

    @Published var location: CLLocation?
    @Published var heading: CLHeading?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10 // Update every 10 meters
        locationManager.headingFilter = 5 // Update every 5 degrees
    }

    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

    func startTracking() {
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }

    func stopTracking() {
        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingHeading()
    }

    // Calculate if a point is ahead of current position based on heading
    func isAhead(targetLocation: CLLocation, coneAngle: Double = 90.0) -> Bool {
        guard let currentLocation = location,
              let currentHeading = heading?.trueHeading else {
            return false
        }

        let bearing = getBearing(from: currentLocation, to: targetLocation)
        let angleDifference = shortestAngleDifference(angle1: currentHeading, angle2: bearing)

        // Consider "ahead" as within coneAngle degrees of current heading
        return abs(angleDifference) <= coneAngle / 2.0
    }

    // Calculate bearing from one location to another
    func getBearing(from: CLLocation, to: CLLocation) -> Double {
        let lat1 = from.coordinate.latitude.toRadians()
        let lon1 = from.coordinate.longitude.toRadians()
        let lat2 = to.coordinate.latitude.toRadians()
        let lon2 = to.coordinate.longitude.toRadians()

        let dLon = lon2 - lon1

        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let bearing = atan2(y, x)

        return (bearing.toDegrees() + 360).truncatingRemainder(dividingBy: 360)
    }

    // Find shortest angle between two bearings
    private func shortestAngleDifference(angle1: Double, angle2: Double) -> Double {
        let diff = (angle2 - angle1 + 180).truncatingRemainder(dividingBy: 360) - 180
        return diff < -180 ? diff + 360 : diff
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        heading = newHeading
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            startTracking()
        }
    }
}

extension Double {
    func toRadians() -> Double {
        return self * .pi / 180
    }

    func toDegrees() -> Double {
        return self * 180 / .pi
    }
}
