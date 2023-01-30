//
//  AstronautResponse.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 27/01/2023.
//

import Foundation

struct AstronautResponse: Codable {
    let count: Int
    let astronauts: [Astronaut]
    
    enum CodingKeys: String, CodingKey {
        case count
        case astronauts = "results"
    }
}
