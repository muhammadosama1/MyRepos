//
//  UserRepos.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct UserRepos: Repository, UserReposProtocol {
    public let session: URLSession
    
    public init(
        session: URLSession = .shared
    ) {
        self.session = session
    }
    
    public func getUserRepos(userName: String) async throws -> [Repo] {
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
