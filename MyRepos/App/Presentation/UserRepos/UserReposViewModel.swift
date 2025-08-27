//
//  UserReposViewModel.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

@MainActor
@Observable
class UserReposViewModel {
    private let getUserReposUseCase: GetUserReposUsecaseProtocol
    
    private(set) var viewState: ViewState<[Repo]> = .idle
    private(set) var repos: [Repo] = []
    
    var searchText = "" {
        didSet {
            if searchText.isEmpty {
                viewState = .loaded(repos)
            } else {
                viewState = .loaded(repos.filter { $0.name.contains(searchText) })
            }
        }
    }
    
    init(
        getUserReposUseCase: GetUserReposUsecaseProtocol
    ) {
        self.getUserReposUseCase = getUserReposUseCase
    }
    
    func fetchRepos() async {
        viewState = .loading
        do {
            repos = try await getUserReposUseCase.execute(userName: "muhammadosama1")
            viewState = .loaded(repos)
        } catch {
            viewState = .error(error)
        }
    }
}
