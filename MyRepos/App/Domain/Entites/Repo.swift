//
//  Repo.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

struct Repo {
    let id: Int
    let name, fullName: String
    let description: String?
    let fork: Bool
    let createdAt, updatedAt, pushedAt: String
    let size, stargazersCount, watchersCount: Int
    let language: String?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool
    let hasPages, hasDiscussions: Bool
    let forksCount: Int
    let archived, disabled: Bool
    let openIssuesCount: Int
    let allowForking, isTemplate: Bool
    let visibility: String
    let forks, openIssues, watchers: Int
    let defaultBranch: String
}
