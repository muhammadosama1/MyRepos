//
//  BranchDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

struct BranchDTO: Codable {
    let name: String
    let commit: CommitDTO
    let protected: Bool
}
