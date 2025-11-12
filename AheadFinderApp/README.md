# Ahead Finder

**Never backtrack again!** Find coffee, gas, food, and more - only in the direction you're driving.

## Features

- 🧭 **Direction-Aware Search**: Only shows results ahead of your current heading
- 🚗 **No Backtracking**: Filters out any location that would require you to turn around
- 📍 **Distance Optimized**: Shows closest options first
- 🎯 **Quick Categories**: One-tap search for Coffee, Gas, Food, Chick-fil-A, and more
- 🗺️ **Maps Integration**: Tap any result to open navigation in Apple Maps
- 👆 **Driver-Safe UI**: Large buttons and clear text for safe glance-and-tap use

## How It Works

1. The app tracks your GPS location and heading (compass direction)
2. When you search for something, it queries Apple Maps within a 5-mile radius
3. Results are filtered to only show places within a 90° cone ahead of you
4. Results are sorted by distance - closest first
5. Tap any result to open turn-by-turn navigation in Apple Maps

## Setup in Xcode

1. Open Xcode and create a new iOS App project
2. Name it "AheadFinder" (or your preferred name)
3. Choose SwiftUI for the interface
4. Replace the generated files with the files from this repository:
   - `AheadFinderApp.swift` → Main app entry point
   - `Views/ContentView.swift` → Main UI
   - `ViewModels/SearchViewModel.swift` → Business logic
   - `Services/LocationManager.swift` → Location & heading tracking
   - `Services/SearchService.swift` → MapKit search & filtering
   - `Models/Place.swift` → Data model
5. Add the `Info.plist` file or merge the location permissions into your existing Info.plist
6. Build and run on a physical device (simulator has limited location features)

## Required Capabilities

- **Location Services**: Required for GPS and heading
- **MapKit**: For searching and opening directions
- **iOS 15.0+**: Minimum deployment target

## Project Structure

```
AheadFinderApp/
├── AheadFinderApp.swift          # App entry point
├── Views/
│   └── ContentView.swift         # Main UI with categories and results
├── ViewModels/
│   └── SearchViewModel.swift     # Search coordination and state
├── Services/
│   ├── LocationManager.swift     # GPS, heading, bearing calculations
│   └── SearchService.swift       # MapKit search & ahead-filtering
├── Models/
│   └── Place.swift              # Place data model
└── Info.plist                   # Location permission strings
```

## Usage

1. Launch the app
2. Grant location permissions when prompted
3. Tap a category button (Coffee, Gas, Food, etc.)
4. See only results ahead of you
5. Tap a result to open navigation in Maps

## Customization

### Add More Categories

Edit `SearchViewModel.swift:15-18`:

```swift
let categories = [
    "Coffee", "Food", "Gas", "Chick-fil-A",
    "Restaurant", "Fast Food", "Pharmacy", "Hotel",
    "Your Custom Category Here"  // Add more!
]
```

### Adjust Search Radius

Edit `SearchService.swift:12`:

```swift
radius: Double = 8000,  // Change from 8000 meters (~5 miles)
```

### Adjust "Ahead" Cone Angle

Edit `LocationManager.swift:40`:

```swift
func isAhead(targetLocation: CLLocation, coneAngle: Double = 90.0) -> Bool {
    // Change 90.0 to make the cone wider or narrower
}
```

## Testing

For best results, test on a physical device while actually driving (as a passenger!) or walking. The simulator's location simulation doesn't provide realistic heading data.

## Safety Notice

This app is designed with large, simple UI elements for quick glances while driving. However, **always prioritize safety**:
- Set up your search before driving
- Use voice commands when possible
- Pull over if you need to interact extensively with the app
- Consider having a passenger operate the app

## License

MIT License - Feel free to use and modify!
