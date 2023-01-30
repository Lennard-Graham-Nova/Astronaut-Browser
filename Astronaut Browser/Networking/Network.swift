//
//  Network.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 26/01/2023.
//

import Foundation

class Network: NetworkProtocol {
    
    private let baseURL = "https://lldev.thespacedevs.com/2.2.0/"
    
    func execute<T: Decodable>(path: String) async throws -> T {
        
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.urlError
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
      
        guard let urlResponse = response as? HTTPURLResponse else {
            throw NetworkError.urlError
        }
        
        switch urlResponse.statusCode {
        case 200..<300:
            do {
                let payload = try JSONDecoder().decode(T.self, from: data)
                return payload
            } catch let error {
                throw error
            }
        case 400:
            throw NetworkError.requestFailure
        default:
            throw NetworkError.requestFailure
        }
    }
}
