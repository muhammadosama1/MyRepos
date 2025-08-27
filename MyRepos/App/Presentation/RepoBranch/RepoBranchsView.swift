//
//  RepoBrachView.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import SwiftUI

struct RepoBranchsView: View {
    @State var viewModel: RepoBranchsViewModel
    
    init(viewModel: RepoBranchsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .loaded(let branches):
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
            case .idle, .loading:
                ProgressView("Loading branches...")
            case .error(let error):
                Text(error.localizedDescription)
                    .font(.headline)
            }
        }
        .navigationTitle("Branches")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await viewModel.fetchBranches()
        }
    }
}


struct TestView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
