//
//  BranchesRepoProtcol.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public protocol BranchesRepoProtocol {
    func getRepoBranches(userName: String, repoName: String) async throws -> [Branch]
}
