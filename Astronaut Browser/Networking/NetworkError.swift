//
//  NetworkError.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 28/01/2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidJson(error: Error)
    case urlError
    case requestFailure
    case fileError
    case decodingError
}

extension NetworkError {
    public var errorDescription: String? {
        switch self {
        case let .invalidJson(error):
            return "Invalid Json with error \(error.localizedDescription)"
        case .urlError:
            return "There's an issue with the URL"
        case .requestFailure:
            return "There's an issue with the request"
        case .fileError:
            return "The file you're trying to open doesn't exsist"
        case .decodingError:
            return "The data wasn't able to be decoded correctly."
            
        }
    }
}
