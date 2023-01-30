//
//  Status.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 27/01/2023.
//

import Foundation

enum StatusEnum: Int, Codable, CaseIterable {
    case all = 0
    case active = 1
    case retired = 2
    case inTraining = 3
    case lostInFlight = 4
    case lostInTraining = 5
    case deadInService = 6
    case dismissed = 7
    case resignedDuringTraining = 8
    case deceased = 11
}

struct Status: Codable, Identifiable, Hashable {
    let id: StatusEnum
}

extension StatusEnum {
    
    var name: String {
        switch self {
        case .all:
            return "All"
        case .active:
            return "Active"
        case .retired:
            return "Retired"
        case .inTraining:
            return "In Training"
        case .lostInFlight:
            return "Lost in Flight"
        case .lostInTraining:
            return "Lost in Training"
        case .deadInService:
            return "Dead in Service"
        case .dismissed:
            return "Dismissed"
        case .resignedDuringTraining:
            return "Resigned During Training"
        case .deceased:
            return "Deceased"
        }
    }
}
