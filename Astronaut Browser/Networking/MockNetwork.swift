//
//  MockNetwork.swift
//  Astronaut BrowserTests
//
//  Created by Lennard Graham on 30/01/2023.
//

import Foundation

class MockNetwork: NetworkProtocol {

    private var testResponseData: Data?
    
    private func parseJsonFile(filename: String) {
        let bundle = Bundle(for: type(of: self))
        guard let launchDataURL = bundle.url(forResource: filename, withExtension: "json") else {
            return
        }
        do {
            testResponseData = try Data(contentsOf: launchDataURL)
        } catch {
            return
        }
    }
    
    func execute<T: Decodable>(path: String) async throws -> T {
        parseJsonFile(filename: path)
        if let data = testResponseData {
            do {
                let payload = try JSONDecoder().decode(T.self, from: data)
                return payload
            } catch {
                throw NetworkError.decodingError
            }
        }
        throw NetworkError.fileError
    }
    
    func getAstronaunt(offSet: Int, limit: Int = 10) async throws -> AstronautResponse {
        return try await execute(path: "AstronautResponseExample")
    }
}
