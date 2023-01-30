//
//  Network+Astronaunt.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 28/01/2023.
//

import Foundation

extension Network {
    func getAstronaunt(offSet: Int, limit: Int = 10) async throws -> AstronautResponse {
        let path = "astronaut/?limit=\(limit)&offset=\(offSet)"
        return try await execute(path: path)
    }
}
