//
//  Agency.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 27/01/2023.
//

import Foundation

struct Agency: Codable, Identifiable, Hashable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
