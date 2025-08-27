//
//  UserReposView.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import SwiftUI

public struct UserReposView: View {
    @State var viewModel: UserReposViewModel
    
    public var body: some View {
        List {
            ForEach(viewModel.repos, id: \.id) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    
                    Text(repo.description ?? "No description available")
                        .font(.caption)
                    
                    Text("\(repo.stargazersCount) out of 5 stars")
                    
                    Text("last update at: \(repo.updatedAt)")
                }
                .onTapGesture {
                    
                }
            }
        }
        .task {
            await viewModel.fetchRepos()
        }
    }
}
