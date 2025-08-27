//
//  GetUserRepos.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public protocol GetUserReposUsecaseProtocol {
    func execute(userName: String) async throws -> [Repo]
}

public struct GetUserReposUsecase: GetUserReposUsecaseProtocol {
    let repo: UserReposProtocol
    
    public init(repo: UserReposProtocol) {
        self.repo = repo
    }
    
    public func execute(userName: String) async throws -> [Repo] {
        try await repo.getUserRepos(userName: userName)
    }
}
