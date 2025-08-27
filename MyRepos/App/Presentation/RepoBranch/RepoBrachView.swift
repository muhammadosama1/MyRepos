//
//  RepoBrachView.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import SwiftUI

public struct RepoBranchView: View {
    @State var viewModel: RepoBranchViewModel
    
    public init(viewModel: RepoBranchViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .idle, .loading:
                    ProgressView("Loading branches...")
                case .loaded(let branches):
                    if branches.isEmpty {
                        Text("No branches found")
                            .foregroundColor(.secondary)
                    } else {
                        List {
                            ForEach(branches, id: \.name) { branch in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(branch.name)
                                        .font(.headline)
                                    
                                    Text("Last commit: \(branch.commit.sha.prefix(7))")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    
                                    Text("Protected: \(branch.protected ? "Yes" : "No")")
                                        .font(.caption)
                                        .foregroundColor(branch.protected ? .green : .orange)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                case .error(let error):
                    VStack {
                        Text("Error loading branches")
                            .font(.headline)
                        Text(error.localizedDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Button("Retry") {
                            Task {
                                await viewModel.fetchBranches()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .navigationTitle("\(viewModel.repoName) Branches")
            .task {
                await viewModel.fetchBranches()
            }
        }
    }
}
