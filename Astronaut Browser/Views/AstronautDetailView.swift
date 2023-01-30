//
//  AstronautDetailView.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 27/01/2023.
//

import SwiftUI

struct AstronautDetailView {
    
    private let astronaut: Astronaut
    private let imageURL: URL?
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        self.imageURL = .init(string: astronaut.profileImage)
    }
    
}

extension AstronautDetailView: View {
    
    var body: some View {
        ScrollView {
            profileImage
            VStack(alignment: .leading, spacing: 8) {
                name
                agencyName
                bio
                if let dateOfBirth = astronaut.dateOfBirth {
                    dateOfBirthText(dateOfBirth: dateOfBirth)
                }
                
                if let instagram = astronaut.instagram {
                    instagramText(instagram: instagram)
                }
                
                if let twitter = astronaut.twitter {
                    twitterText(twitter: twitter)
                }
                
                if let wiki = astronaut.wiki {
                    wikiText(wiki: wiki)
                }
            }
            .padding(.horizontal, 10)
        }
        .background(Color.babyBlue)
    }
    
    private var name: some View {
        Text("Name: \(astronaut.name)")
    }
    
    private var agencyName: some View {
        Text("Agency name: \(astronaut.agency.name)")
    }
    
    private var bio: some View {
        Text("Bio: \(astronaut.bio)")
            .padding(.vertical, 12)
    }
    
    private func dateOfBirthText(dateOfBirth: String) -> some View {
        return Text("Date of Brith: \(dateOfBirth)")
    }
    
    private func instagramText(instagram: String) -> some View {
        return Text("Instagram: \(instagram)")
    }
    
    private func twitterText(twitter: String) -> some View {
        return Text("Twitter: \(twitter)")
    }
    
    private func wikiText(wiki: String) -> some View {
        return Text("Wiki: \(wiki)")
    }
    
    private var profileImage: some View {
        AsyncImage(url: imageURL) { image in
            image.resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
    }
    
}

struct AstronautDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautDetailView(astronaut: .stub())
    }
}
