//
//  UserReposView.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import SwiftUI

public struct UserReposView: View {
    @State var viewModel: UserReposViewModel
    
    public init(viewModel: UserReposViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.repos, id: \.id) { repo in
                    NavigationLink(value: repo) {
                        VStack(alignment: .leading) {
                            Text(repo.name)
                                .font(.headline)
                            
                            Text(repo.description ?? "No description available")
                                .font(.caption)
                            
                            Text("\(repo.stargazersCount) out of 5 stars")
                            
                            Text("last update at: \(repo.updatedAt)")
                        }
                    }
                }
            }
            .navigationTitle("Repositories")
            .navigationDestination(for: Repo.self) { repo in
                RepoBranchView(
                    viewModel: RepoBranchViewModel(
                        getBranchesUsecase: GetUserBranchesUsecase(
                            repo: BranchesRepo()
                        ),
                        userName: "muhammadosama1",
                        repoName: repo.name
                    )
                )
            }
            .task {
                await viewModel.fetchRepos()
            }
        }
    }
}
