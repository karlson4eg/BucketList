//
//  Location.swift
//  BucketList
//
//  Created by Evi St on 4/24/22.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longtitude: Double
    
    
}
