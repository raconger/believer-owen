import Foundation
import SwiftUI
import CoreLocation

class SearchViewModel: ObservableObject {
    @Published var places: [Place] = []
    @Published var isSearching = false
    @Published var selectedCategory: String?

    var locationManager: LocationManager
    private let searchService = SearchService()

    // Quick search categories
    let categories = [
        "Coffee", "Food", "Gas", "Chick-fil-A",
        "Restaurant", "Fast Food", "Pharmacy", "Hotel"
    ]

    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }

    func search(query: String) {
        guard let location = locationManager.location else {
            print("No location available")
            return
        }

        isSearching = true
        selectedCategory = query

        searchService.search(query: query, location: location) { [weak self] items in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.places = self.searchService.filterAheadOnly(
                    items: items,
                    currentLocation: location,
                    locationManager: self.locationManager
                )
                self.isSearching = false
            }
        }
    }

    func clearResults() {
        places = []
        selectedCategory = nil
    }

    func openInMaps(_ place: Place) {
        place.mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ])
    }
}
