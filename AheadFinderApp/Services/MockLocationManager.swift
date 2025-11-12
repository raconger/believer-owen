import Foundation
import CoreLocation
import Combine

/// Mock location manager for simulator testing
/// Simulates a fixed location with controllable heading
class MockLocationManager: LocationManager {

    @Published var mockHeadingValue: Double = 0.0 // 0 = North, 90 = East, 180 = South, 270 = West

    private var mockLocation = CLLocation(
        latitude: 37.7749,  // San Francisco
        longitude: -122.4194
    )

    override init() {
        super.init()

        // Set mock location
        self.location = mockLocation

        // Create mock heading
        updateMockHeading()
    }

    func updateMockHeading() {
        let mockCLHeading = MockCLHeading(trueHeading: mockHeadingValue)
        self.heading = mockCLHeading
    }

    func setHeading(_ degrees: Double) {
        mockHeadingValue = degrees
        updateMockHeading()
    }

    func rotateHeading(by degrees: Double) {
        mockHeadingValue = (mockHeadingValue + degrees).truncatingRemainder(dividingBy: 360)
        if mockHeadingValue < 0 {
            mockHeadingValue += 360
        }
        updateMockHeading()
    }

    override func requestPermission() {
        // Simulate authorization
        self.authorizationStatus = .authorizedWhenInUse
    }

    override func startTracking() {
        // Already tracking with mock data
        self.authorizationStatus = .authorizedWhenInUse
    }
}

/// Mock CLHeading for testing
class MockCLHeading: CLHeading {
    private let _trueHeading: Double

    init(trueHeading: Double) {
        self._trueHeading = trueHeading
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var trueHeading: CLLocationDirection {
        return _trueHeading
    }

    override var magneticHeading: CLLocationDirection {
        return _trueHeading
    }
}
