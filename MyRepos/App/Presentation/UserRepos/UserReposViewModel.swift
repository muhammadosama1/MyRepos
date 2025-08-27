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
    private(set) var viewState: ViewState<[Repo]> = .idle
    
    private let getUserReposUseCase: GetUserReposUsecaseProtocol
    
    init(
        getUserReposUseCase: GetUserReposUsecaseProtocol
    ) {
        self.getUserReposUseCase = getUserReposUseCase
    }
    
    func fetchRepos() async {
        viewState = .loading
        do {
            let repos = try await getUserReposUseCase.execute(userName: "muhammadosama1")
            viewState = .loaded(repos)
        } catch {
            viewState = .error(error)
        }
    }
}
