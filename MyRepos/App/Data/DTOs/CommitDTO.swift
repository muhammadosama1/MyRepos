//
//  CommitDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct CommitDTO: Codable {
    public let sha: String
    public let url: String
    
    public init(sha: String, url: String) {
        self.sha = sha
        self.url = url
    }
}
