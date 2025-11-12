import SwiftUI
import CoreLocation

/// Enhanced ContentView with simulation controls for testing in Simulator
struct SimulationContentView: View {
    @StateObject private var mockLocationManager = MockLocationManager()
    @StateObject private var realLocationManager = LocationManager()
    @StateObject private var viewModel: SearchViewModel

    @State private var useSimulation = true
    @State private var showControls = true

    init() {
        let mockManager = MockLocationManager()
        _mockLocationManager = StateObject(wrappedValue: mockManager)
        _viewModel = StateObject(wrappedValue: SearchViewModel(locationManager: mockManager))
    }

    var activeLocationManager: LocationManager {
        useSimulation ? mockLocationManager : realLocationManager
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Status bar
                StatusBarView(locationManager: activeLocationManager)

                // Simulation controls
                if useSimulation && showControls {
                    SimulationControlsView(locationManager: mockLocationManager)
                }

                if viewModel.places.isEmpty {
                    // Search categories
                    CategoryGridView(viewModel: viewModel)
                } else {
                    // Results list
                    ResultsListView(viewModel: viewModel)
                }
            }
            .navigationTitle("Ahead Finder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(useSimulation ? "Sim Mode" : "Real GPS") {
                        toggleMode()
                    }
                    .font(.caption)
                    .foregroundColor(useSimulation ? .orange : .green)
                }

                if !viewModel.places.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear") {
                            viewModel.clearResults()
                        }
                        .font(.headline)
                    }
                }

                if useSimulation {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(showControls ? "Hide" : "Show") {
                            showControls.toggle()
                        }
                        .font(.caption)
                    }
                }
            }
        }
        .onAppear {
            activeLocationManager.requestPermission()
        }
    }

    func toggleMode() {
        useSimulation.toggle()
        // Update viewModel's location manager
        viewModel.locationManager = activeLocationManager
        activeLocationManager.requestPermission()
    }
}

struct SimulationControlsView: View {
    @ObservedObject var locationManager: MockLocationManager

    var body: some View {
        VStack(spacing: 12) {
            Text("Simulation Controls")
                .font(.headline)

            // Heading display
            HStack {
                Text("Current Heading:")
                Spacer()
                Text("\(Int(locationManager.mockHeadingValue))° \(directionName)")
                    .fontWeight(.bold)
            }

            // Rotation buttons
            HStack(spacing: 12) {
                Button(action: { locationManager.rotateHeading(by: -45) }) {
                    Label("", systemImage: "arrow.counterclockwise")
                        .font(.title2)
                }
                .buttonStyle(.bordered)

                Button(action: { locationManager.setHeading(0) }) {
                    Text("North")
                }
                .buttonStyle(.bordered)

                Button(action: { locationManager.setHeading(90) }) {
                    Text("East")
                }
                .buttonStyle(.bordered)

                Button(action: { locationManager.setHeading(180) }) {
                    Text("South")
                }
                .buttonStyle(.bordered)

                Button(action: { locationManager.setHeading(270) }) {
                    Text("West")
                }
                .buttonStyle(.bordered)

                Button(action: { locationManager.rotateHeading(by: 45) }) {
                    Label("", systemImage: "arrow.clockwise")
                        .font(.title2)
                }
                .buttonStyle(.bordered)
            }

            // Slider for precise control
            VStack {
                Text("Fine Control")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Slider(value: Binding(
                    get: { locationManager.mockHeadingValue },
                    set: { locationManager.setHeading($0) }
                ), in: 0...360, step: 1)
            }

            Text("San Francisco (37.7749, -122.4194)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }

    var directionName: String {
        let heading = locationManager.mockHeadingValue
        switch heading {
        case 337.5...360, 0..<22.5: return "N"
        case 22.5..<67.5: return "NE"
        case 67.5..<112.5: return "E"
        case 112.5..<157.5: return "SE"
        case 157.5..<202.5: return "S"
        case 202.5..<247.5: return "SW"
        case 247.5..<292.5: return "W"
        case 292.5..<337.5: return "NW"
        default: return ""
        }
    }
}

#Preview {
    SimulationContentView()
}
