//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Evi St on 4/25/22.
//

import Foundation
import MapKit



extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapregion.center.latitude, longtitude: mapregion.center.longitude)
            
            locations.append(newLocation)
            save()
        }
        
        func updateLocation(location: Location){
            guard let selectedPlace = selectedPlace else { return }
            
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
    }
}

