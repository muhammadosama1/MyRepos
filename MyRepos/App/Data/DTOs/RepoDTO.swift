//
//  RepoDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct RepoDTO: Codable {
    public let id: Int
    public let name, fullName: String
    public let owner: OwnerDTO
    public let description: String?
    public let fork: Bool
    public let createdAt, updatedAt, pushedAt: String
    public let stargazersCount, watchersCount: Int
    public let forksCount: Int
    public let forks, openIssues, watchers: Int
    public let defaultBranch: String

    public init(
        id: Int,
        name: String,
        fullName: String,
        owner: OwnerDTO,
        description: String?,
        fork: Bool,
        createdAt: String,
        updatedAt: String,
        pushedAt: String,
        stargazersCount: Int,
        watchersCount: Int,
        forksCount: Int,
        forks: Int,
        openIssues: Int,
        watchers: Int,
        defaultBranch: String
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
        self.description = description
        self.fork = fork
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.forksCount = forksCount
        self.forks = forks
        self.openIssues = openIssues
        self.watchers = watchers
        self.defaultBranch = defaultBranch
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case description, fork
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        
    }
}
