//
//  OwnerDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

struct OwnerDTO: Codable {
    let id: Int
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatar_url"
    }
}
