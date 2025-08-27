//
//  GetUserRepos.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

protocol GetUserReposUsecaseProtocol {
    func execute(userName: String) async throws -> [Repo]
}

struct GetUserReposUsecase: GetUserReposUsecaseProtocol {
    let repo: UserReposProtocol
    
    init(repo: UserReposProtocol) {
        self.repo = repo
    }
    
    func execute(userName: String) async throws -> [Repo] {
        try await repo.getUserRepos(userName: userName)
    }
}
