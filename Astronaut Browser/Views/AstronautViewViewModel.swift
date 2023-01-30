//
//  AstronautViewViewModel.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 26/01/2023.
//

import SwiftUI

class AstronautViewViewModel: ObservableObject {
    
    private let network: NetworkProtocol
    
    @Published var isLoading: Bool = false
    @Published var astronauts: [Astronaut] = []
    @Published var filteredAstronauts: [Astronaut] = []
    @Published var astronoutPath = NavigationPath()
    @Published var error: Error?
    @Published var selectedStatus: StatusEnum = .all
    
    var loadMoreOffSet: Int = 2
    var hasInitialLoad: Bool = false
    let limit: Int = 10
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    @MainActor
    func getAstronauts() async {
        do {
            isLoading = true
            let astronautResponse = try await network.getAstronaunt(offSet: astronauts.count, limit: limit)
            astronauts.append(contentsOf: astronautResponse.astronauts)
            filter(status: selectedStatus)
            isLoading = false
        } catch let error {
            self.error = error
            isLoading = false
        }
    }
    
    func filter(status: StatusEnum) {
        if status == .all {
            filteredAstronauts = astronauts
        } else {
            filteredAstronauts = astronauts.filter {$0.status.id == status}
        }
    }
}
