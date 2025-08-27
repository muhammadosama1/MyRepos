//
//  RepoDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct RepoDTO: Codable {
    let id: Int
    let name, fullName: String
    let owner: OwnerDTO
    let description: String?
    let fork: Bool
    let createdAt, updatedAt: String
    let stargazersCount, watchersCount: Int
    let forksCount: Int
    let forks, openIssues, watchers: Int
    let defaultBranch: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case description, fork
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
    }
}
