# Simulation Guide for Ahead Finder

Testing a direction-aware app without driving around can be challenging. Here are your options:

## Option 1: Simulation Mode (Built-in) ⭐ EASIEST

The app includes a built-in simulation mode perfect for testing in the iOS Simulator or on a device.

### Setup:

1. In `AheadFinderApp.swift`, change the ContentView to SimulationContentView:

```swift
@main
struct AheadFinderApp: App {
    var body: some Scene {
        WindowGroup {
            SimulationContentView()  // Use this for testing
            // ContentView()          // Use this for production
        }
    }
}
```

2. Run in iOS Simulator or on a device
3. You'll see orange simulation controls at the top

### Using Simulation Mode:

- **Quick Direction Buttons**: Tap N/E/S/W to face that direction
- **Rotate Buttons**: Use ↶/↷ to rotate 45° at a time
- **Fine Slider**: Drag for precise heading control
- **Toggle**: Tap "Sim Mode" to switch to real GPS (device only)
- **Hide Controls**: Tap "Hide" to test the clean UI

### How It Works:

- Mock location set to San Francisco (37.7749, -122.4194)
- You control heading from 0° (North) to 360°
- Search for "Coffee" and rotate to see results appear/disappear
- Only places in your heading direction (±45°) show up

---

## Option 2: GPX Route Simulation

For more realistic testing with a driving route.

### Setup:

1. Add `DrivingRoute.gpx` to your Xcode project
2. Run on a **physical device** (plug in iPhone)
3. Start the app
4. In Xcode: **Debug → Simulate Location → DrivingRoute**

### What Happens:

- Device follows the route: North → East → South
- Heading updates automatically based on route direction
- More realistic than manual control
- Test continuous updates while "driving"

### Customize GPX:

Edit `DrivingRoute.gpx` and change:
- `<trkpt lat="..." lon="...">` - GPS coordinates
- `<course>` - Heading in degrees (0=N, 90=E, 180=S, 270=W)
- `<speed>` - Speed in m/s (29 = ~65 mph)
- `<time>` - Time intervals between points

Use https://mapstogpx.com or similar to create routes from real roads.

---

## Option 3: Real-World Testing

The gold standard for testing.

### Best Practice:

1. Use production mode (`ContentView` not `SimulationContentView`)
2. Build to a physical device
3. Test as a passenger or walking
4. Try different scenarios:
   - Drive north, search Coffee - see only ahead results
   - Turn around, watch results flip
   - Compare with Google Maps to verify accuracy

---

## Testing Checklist

- [ ] Heading displays correctly
- [ ] Search returns results
- [ ] Results only show ahead (rotate 180° to verify they disappear)
- [ ] Distance calculations accurate
- [ ] Tap result opens Apple Maps
- [ ] Location permission flow works
- [ ] UI readable and tap-friendly
- [ ] Works on different screen sizes

---

## Troubleshooting

**"No results ahead" but there should be results:**
- Check heading is pointing toward where you expect
- Try widening search radius in `SearchService.swift:12`
- Verify location is correct (check SF coordinates)

**Simulator not updating heading:**
- This is expected - simulator doesn't support heading
- Use Simulation Mode or physical device + GPX

**Results not filtering correctly:**
- Check cone angle in `LocationManager.swift:40`
- Default is 90° (±45° from heading)
- Increase for wider "ahead" area

**Mock location not working:**
- Ensure `SimulationContentView` is being used
- Check that "Sim Mode" button shows in toolbar
- Verify orange controls are visible

---

## Quick Test Scenario

1. Enable Simulation Mode
2. Set heading to **0° (North)**
3. Search for "Coffee"
4. Note the results
5. Rotate to **180° (South)**
6. Results should completely change (showing different coffee shops)
7. This proves ahead-only filtering works!

---

## Production vs Simulation

**For Development:** Use `SimulationContentView`
- Test in simulator
- Quick heading changes
- No need to move around

**For Production:** Use `ContentView`
- Real GPS and compass
- Actual driving experience
- Submit to App Store with this version

Remember to switch before release!
