//
//  Astronaut_BrowserApp.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 26/01/2023.
//

import SwiftUI

@main
struct Astronaut_BrowserApp: App {
    var body: some Scene {
        WindowGroup {
            AstronautListView(viewModel: .init())
        }
    }
}
