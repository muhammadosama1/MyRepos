//
//  SimpleDIContainer.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public final class DIContainer {
    public static let shared = DIContainer()
    
    private init() {}
    
    lazy var userRepos: UserReposProtocol = {
        UserRepos()
    }()
    
    lazy var branchesRepo: BranchesRepoProtocol = {
        BranchesRepo()
    }()
    
    lazy var getUserReposUseCase: GetUserReposUsecaseProtocol = {
        GetUserReposUsecase(repo: userRepos)
    }()
    
    lazy var getUserBranchesUseCase: GetUserBranchesUsecaseProtocol = {
        GetUserBranchesUsecase(repo: branchesRepo)
    }()
    
    func makeUserReposViewModel() -> UserReposViewModel {
        UserReposViewModel(getUserReposUseCase: getUserReposUseCase)
    }
    
    func makeRepoBranchViewModel(repoName: String) -> RepoBranchsViewModel {
        RepoBranchsViewModel(
            getBranchesUsecase: getUserBranchesUseCase,
            repoName: repoName
        )
    }
}

extension DIContainer {
    public var repos: UserReposProtocol { userRepos }
    public var branches: BranchesRepoProtocol { branchesRepo }
    public var reposUseCase: GetUserReposUsecaseProtocol { getUserReposUseCase }
    public var branchesUseCase: GetUserBranchesUsecaseProtocol { getUserBranchesUseCase }
}

public let DI = DIContainer.shared
