//
//  UserReposViewModel.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

@MainActor
@Observable
public class UserReposViewModel {
    private(set) var repos: [Repo] = []
    private(set) var error: String? = nil
    private(set) var viewState: ViewState<[Repo]> = .idle
    
    private let getUserReposUseCase: GetUserReposUsecaseProtocol
    
    public init(
        getUserReposUseCase: GetUserReposUsecaseProtocol
    ) {
        self.getUserReposUseCase = getUserReposUseCase
    }
    
    public func fetchRepos() async {
        do {
            repos = try await getUserReposUseCase.execute(userName: "muhammadosama1")
        } catch {
            self.error = error.localizedDescription
        }
    }
}
