//
//  Repo.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct Repo: Hashable {
    let id: Int
    let name, fullName: String
    let owner: Owner
    let description: String?
    let fork: Bool
    let createdAt, updatedAt: String
    let stargazersCount, watchersCount: Int
    let forksCount: Int
    let forks, openIssues, watchers: Int
    let defaultBranch: String
    
    public init(
        id: Int,
        name: String,
        fullName: String,
        owner: Owner,
        description: String?,
        fork: Bool,
        createdAt: String,
        updatedAt: String,
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
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.forksCount = forksCount
        self.forks = forks
        self.openIssues = openIssues
        self.watchers = watchers
        self.defaultBranch = defaultBranch
    }
}
