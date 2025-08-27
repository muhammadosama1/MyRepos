//
//  BranchMapping.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

extension RepoDTO {
    func mapping() -> Repo {
        Repo(
            id: id,
            name: name,
            fullName: fullName,
            description: description,
            fork: fork,
            createdAt: createdAt,
            updatedAt: updatedAt,
            pushedAt: pushedAt,
            size: size,
            stargazersCount: stargazersCount,
            watchersCount: watchersCount,
            language: language,
            hasIssues: hasIssues,
            hasProjects: hasProjects,
            hasDownloads: hasDownloads,
            hasWiki: hasWiki,
            hasPages: hasPages,
            hasDiscussions: hasDiscussions,
            forksCount: forksCount,
            archived: archived,
            disabled: disabled,
            openIssuesCount: openIssuesCount,
            allowForking: allowForking,
            isTemplate: isTemplate,
            visibility: visibility,
            forks: forks,
            openIssues: openIssues,
            watchers: watchers,
            defaultBranch: defaultBranch
        )
    }
}
