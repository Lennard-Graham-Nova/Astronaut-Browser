//
//  Astronaut+.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 30/01/2023.
//

import Foundation

extension Astronaut {
    static func stub(id: Int = 1, url: String = "url", name: String = "name", status: Status = .init(id: .active), age: Int = 64, dateOfBirth: String = "1990-12-12", twitter: String = "Twitter", instagram: String = "Instagram", wiki: String = "Wiki", bio: String = "bio", agency: Agency = .init(id: 1, name: "Best Agency"), profileImage: String = "", profileImageThumbnail: String = "") -> Astronaut {
        Astronaut(id: id, url: url, name: name, status: status, age: age, dateOfBirth: dateOfBirth, twitter: twitter, instagram: instagram, wiki: wiki, bio: bio, agency: agency, profileImage: profileImage, profileImageThumbnail: profileImageThumbnail)
    }
}
