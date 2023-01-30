//
//  NetworkProtocol.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 30/01/2023.
//

import Foundation

protocol NetworkProtocol {
    func execute<T: Decodable>(path: String) async throws -> T
    
    func getAstronaunt(offSet: Int, limit: Int) async throws -> AstronautResponse
}
