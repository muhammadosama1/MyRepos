//
//  Owner.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct Owner: Hashable, Equatable {
    let id: Int
    let avatarURL: String
    
    public init(
        id: Int,
        avatarURL: String
    ) {
        self.id = id
        self.avatarURL = avatarURL
    }
}
