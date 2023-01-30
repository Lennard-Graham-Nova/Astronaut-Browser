//
//  Astronaut.swift
//  Astronaut Browser
//
//  Created by Lennard Graham on 26/01/2023.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {

    let id: Int
    let url: String
    let name: String
    let status: Status
    let age: Int
    let dateOfBirth: String?
    let twitter, instagram, wiki: String?
    let bio: String
    let agency: Agency
    let profileImage: String
    let profileImageThumbnail: String

    enum CodingKeys: String, CodingKey {
        case id, url, name, status, age
        case dateOfBirth = "date_of_birth"
        case bio, twitter, instagram, wiki, agency
        case profileImage = "profile_image"
        case profileImageThumbnail = "profile_image_thumbnail"
    }
}
