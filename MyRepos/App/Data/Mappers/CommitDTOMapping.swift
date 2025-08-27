//
//  CommitDTOMapping.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public extension CommitDTO {
    public func mapping() -> Commit {
        return Commit(
            sha: sha,
            url: url
        )
    }
}
