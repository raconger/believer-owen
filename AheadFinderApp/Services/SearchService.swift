import Foundation
import MapKit
import CoreLocation

class SearchService {

    func search(query: String,
                location: CLLocation,
                radius: Double = 8000, // ~5 miles in meters
                completion: @escaping ([MKMapItem]) -> Void) {

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: radius * 2,
            longitudinalMeters: radius * 2
        )

        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error = error {
                print("Search error: \(error.localizedDescription)")
                completion([])
                return
            }

            completion(response?.mapItems ?? [])
        }
    }

    func filterAheadOnly(
        items: [MKMapItem],
        currentLocation: CLLocation,
        locationManager: LocationManager
    ) -> [Place] {

        var places: [Place] = []

        for item in items {
            let itemLocation = CLLocation(
                latitude: item.placemark.coordinate.latitude,
                longitude: item.placemark.coordinate.longitude
            )

            // Check if ahead
            if locationManager.isAhead(targetLocation: itemLocation) {
                let distance = currentLocation.distance(from: itemLocation)
                let bearing = locationManager.getBearing(from: currentLocation, to: itemLocation)

                let place = Place(
                    mapItem: item,
                    name: item.name ?? "Unknown",
                    distance: distance,
                    bearing: bearing,
                    category: item.pointOfInterestCategory?.rawValue ?? ""
                )

                places.append(place)
            }
        }

        // Sort by distance
        return places.sorted { $0.distance < $1.distance }
    }
}
