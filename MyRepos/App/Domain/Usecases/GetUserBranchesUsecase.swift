//
//  GetUserBranches.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

protocol GetUserBranchesUsecaseProtocol {
    func execute(userName: String, repoName: String) async throws -> [Branch]
}

struct GetUserBranchesUsecase: GetUserBranchesUsecaseProtocol {
    let repo: BranchesRepoProtocol
    
    init(repo: BranchesRepoProtocol) {
        self.repo = repo
    }
    
    func execute(userName: String, repoName: String) async throws -> [Branch] {
        try await repo.getRepoBranches(userName: userName, repoName: repoName)
    }
}
