import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem
    let name: String
    let distance: Double // in meters
    let bearing: Double // degrees from north
    let category: String

    var distanceFormatted: String {
        let miles = distance * 0.000621371
        if miles < 0.1 {
            return String(format: "%.0f ft", distance * 3.28084)
        } else {
            return String(format: "%.1f mi", miles)
        }
    }
}
