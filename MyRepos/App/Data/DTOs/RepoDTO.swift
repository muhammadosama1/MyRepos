//
//  RepoDTO.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

struct RepoDTO: Codable {
    let id: Int
    let name, fullName: String
    let owner: OwnerDTO
    let description: String?
    let fork: Bool
    let createdAt, updatedAt, pushedAt: String
    let homepage: String?
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

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case description, fork
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDiscussions = "has_discussions"
        case forksCount = "forks_count"
        case archived, disabled
        case openIssuesCount = "open_issues_count"
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case visibility, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        
    }
}
