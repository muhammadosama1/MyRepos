//
//  RepoBranchViewModel.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

@MainActor
@Observable
public class RepoBranchsViewModel {
    private let userName: String
    let repoName: String
    var viewState: ViewState<[Branch]> = .idle
    
    private let getBranchesUsecase: GetUserBranchesUsecaseProtocol
    
    
    public init(
        getBranchesUsecase: GetUserBranchesUsecaseProtocol,
        userName: String,
        repoName: String
    ) {
        self.getBranchesUsecase = getBranchesUsecase
        self.userName = userName
        self.repoName = repoName
    }
    
    public func fetchBranches() async {
        viewState = .loading
        do {
            let branches = try await getBranchesUsecase.execute(userName: userName, repoName: repoName)
            viewState = .loaded(branches)
        } catch {
            viewState = .error(error)
        }
    }
}

