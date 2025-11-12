import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel: SearchViewModel

    init() {
        let locManager = LocationManager()
        _locationManager = StateObject(wrappedValue: locManager)
        _viewModel = StateObject(wrappedValue: SearchViewModel(locationManager: locManager))
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Status bar
                StatusBarView(locationManager: locationManager)

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
                if !viewModel.places.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Clear") {
                            viewModel.clearResults()
                        }
                        .font(.headline)
                    }
                }
            }
        }
        .onAppear {
            locationManager.requestPermission()
        }
    }
}

struct StatusBarView: View {
    @ObservedObject var locationManager: LocationManager

    var body: some View {
        HStack {
            Image(systemName: "location.fill")
            Text(statusText)
                .font(.subheadline)

            Spacer()

            if let heading = locationManager.heading?.trueHeading {
                HStack(spacing: 4) {
                    Image(systemName: "location.north.fill")
                    Text("\(Int(heading))°")
                }
                .font(.subheadline)
            }
        }
        .padding()
        .background(Color(.systemGray6))
    }

    var statusText: String {
        if locationManager.location != nil {
            return "Tracking"
        } else if locationManager.authorizationStatus == .denied {
            return "Location Denied"
        } else {
            return "No Location"
        }
    }
}

struct CategoryGridView: View {
    @ObservedObject var viewModel: SearchViewModel

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.categories, id: \.self) { category in
                    CategoryButton(
                        title: category,
                        isSearching: viewModel.isSearching && viewModel.selectedCategory == category
                    ) {
                        viewModel.search(query: category)
                    }
                }
            }
            .padding()
        }
    }
}

struct CategoryButton: View {
    let title: String
    let isSearching: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.blue)
                    .frame(height: 100)

                if isSearching {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                } else {
                    VStack(spacing: 8) {
                        Image(systemName: iconForCategory(title))
                            .font(.system(size: 30))
                        Text(title)
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .disabled(isSearching)
    }

    func iconForCategory(_ category: String) -> String {
        switch category.lowercased() {
        case "coffee": return "cup.and.saucer.fill"
        case "food", "restaurant": return "fork.knife"
        case "gas": return "fuelpump.fill"
        case "chick-fil-a", "fast food": return "takeoutbag.and.cup.and.straw.fill"
        case "pharmacy": return "cross.case.fill"
        case "hotel": return "bed.double.fill"
        default: return "mappin.and.ellipse"
        }
    }
}

struct ResultsListView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.places.isEmpty && !viewModel.isSearching {
                VStack(spacing: 16) {
                    Image(systemName: "arrow.up.circle")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                    Text("No results ahead")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Text("Try a different search or\nkeep driving forward")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxHeight: .infinity)
            } else {
                List {
                    ForEach(viewModel.places) { place in
                        PlaceRow(place: place) {
                            viewModel.openInMaps(place)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct PlaceRow: View {
    let place: Place
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(place.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)

                    if let address = place.mapItem.placemark.thoroughfare {
                        Text(address)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text(place.distanceFormatted)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)

                    Image(systemName: "arrow.forward.circle.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 12)
        }
    }
}

#Preview {
    ContentView()
}
