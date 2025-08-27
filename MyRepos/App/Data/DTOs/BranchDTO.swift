//
//  BranchDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct BranchDTO: Codable {
    public let name: String
    public let commit: CommitDTO
    public let protected: Bool
    
    public init(name: String, commit: CommitDTO, protected: Bool) {
        self.name = name
        self.commit = commit
        self.protected = protected
    }
}
