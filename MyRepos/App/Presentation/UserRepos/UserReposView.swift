//
//  UserReposView.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import SwiftUI

struct UserReposView: View {
    @State var viewModel: UserReposViewModel
    
    init(viewModel: UserReposViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            switch viewModel.viewState {
            case .loaded(let repos):
                List {
                    ForEach(repos, id: \.id) { repo in
                        NavigationLink(value: repo.name) {
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
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: String.self) { name in
                    RepoBranchsView(
                        viewModel: DI.makeRepoBranchViewModel(
                            repoName: name
                        )
                    )
                }
            case .idle, .loading:
                ProgressView("Loading branches...")
                    .task {
                        await viewModel.fetchRepos()
                    }
            case .error(let error):
                Text(error.localizedDescription)
                    .font(.headline)
            }
        }
    }
}
