//
//  AstronautCell.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 27/01/2023.
//

import SwiftUI

struct AstronautCell {
    
    private let astronaut: Astronaut
    private let imageURL: URL?

    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        self.imageURL = .init(string: astronaut.profileImageThumbnail)
    }
}

extension AstronautCell: View {
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                name
                agencyName
            }
            Spacer()
            thumbnail
        }
    }
    
    private var name: some View {
        Text("Name: \(astronaut.name)")
            .padding(.bottom, 4)
    }
    
    private var agencyName: some View {
        Text("Agency name: \(astronaut.agency.name)")
    }
    
    private var thumbnail: some View {
        AsyncImage(url: imageURL) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 150, height: 150)
    }
}

struct AstronautCell_Previews: PreviewProvider {
    static var previews: some View {
        AstronautCell(astronaut: .stub())
    }
}
