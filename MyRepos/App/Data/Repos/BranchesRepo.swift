//
//  BranchesRepo.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct BranchesRepo: Repository {
    let session: URLSession
    let userName: String
    let repoName: String
    
    init(
        session: URLSession = .shared,
        userName: String = "muhammadosama1",
        repoName: String = "MorningNews"
    ) {
        self.session = session
        self.userName = userName
        self.repoName = repoName
    }
    
    func getRepoBranches() async throws -> [Branch] {
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
