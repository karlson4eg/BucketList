//
//  Location.swift
//  BucketList
//
//  Created by Evi St on 4/24/22.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longtitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    }
    
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Quun lives with her dorgies", latitude: 51.501, longtitude: -0.141)
    
    static func == (lhs: Location,  rhs: Location) -> Bool{
        lhs.id == rhs.id
    }
    
}
