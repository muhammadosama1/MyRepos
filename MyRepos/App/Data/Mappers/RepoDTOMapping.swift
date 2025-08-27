//
//  BranchMapping.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public extension RepoDTO {
    func mapping() -> Repo {
        Repo(
            id: id,
            name: name,
            fullName: fullName,
            owner: owner.mapping(),
            description: description,
            fork: fork,
            createdAt: createdAt,
            updatedAt: updatedAt,
            pushedAt: pushedAt,
            stargazersCount: stargazersCount,
            watchersCount: watchersCount,
            forksCount: forksCount,
            forks: forks,
            openIssues: openIssues,
            watchers: watchers,
            defaultBranch: defaultBranch
        )
    }
}
