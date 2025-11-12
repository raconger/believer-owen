import SwiftUI

@main
struct AheadFinderApp: App {
    var body: some Scene {
        WindowGroup {
            // SIMULATION MODE: Use this for testing in Simulator or for debugging
            // Includes heading controls and mock location (San Francisco)
            SimulationContentView()

            // PRODUCTION MODE: Use this for real-world use and App Store builds
            // Uses actual GPS and compass data
            // ContentView()
        }
    }
}
