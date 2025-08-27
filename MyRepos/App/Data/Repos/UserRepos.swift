//
//  UserRepos.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct UserRepos: Repository {
    let session: URLSession
    let userName: String
    
    init(
        session: URLSession = .shared,
        userName: String = "muhammadosama1"
    ) {
        self.session = session
        self.userName = userName
    }
    
    func getUserRepos() async throws -> [Repo] {
        let url = URL(string: "\(baseURL)users/\(userName)/repos")!
        do {
            let (data, response) = try await session.data(for: URLRequest(url: url))
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw NetworkErrors.unauthorized
            }
            let decoder = JSONDecoder()
            let repos = try decoder.decode([RepoDTO].self, from: data)
            return repos.map{ $0.mapping() }
        } catch {
            throw NetworkErrors.badURL
        }
    }
}
