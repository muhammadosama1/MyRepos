//
//  OwnerDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct OwnerDTO: Codable {
    public let id: Int
    public let avatarURL: String

    public init(id: Int, avatarURL: String) {
        self.id = id
        self.avatarURL = avatarURL
    }

    enum CodingKeys: String, CodingKey {
        case id
        case avatarURL = "avatar_url"
    }
}
