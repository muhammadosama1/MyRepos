//
//  GetUserBranches.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public protocol GetUserBranchesUsecaseProtocol {
    func execute(userName: String, repoName: String) async throws -> [Branch]
}

public struct GetUserBranchesUsecase: GetUserBranchesUsecaseProtocol {
    let repo: BranchesRepoProtocol
    
    public init(repo: BranchesRepoProtocol) {
        self.repo = repo
    }
    
    public func execute(userName: String, repoName: String) async throws -> [Branch] {
        try await repo.getRepoBranches(userName: userName, repoName: repoName)
    }
}
