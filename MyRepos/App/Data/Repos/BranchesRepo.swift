//
//  BranchesRepo.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct BranchesRepo: Repository, BranchesRepoProtocol {
    let session: URLSession
    
    init(
        session: URLSession = .shared
    ) {
        self.session = session
    }
    
    func getRepoBranches(
        userName: String,
        repoName: String
    ) async throws -> [Branch] {
        let url = URL(string: "\(baseURL)repos/\(userName)/\(repoName)/branches")!
        do {
            let (data, response) = try await session.data(for: URLRequest(url: url))
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw NetworkErrors.unauthorized
            }
            let decoder = JSONDecoder()
            let repos = try decoder.decode([BranchDTO].self, from: data)
            return repos.map{ $0.mapping() }
        } catch {
            throw NetworkErrors.badURL
        }
    }
}
