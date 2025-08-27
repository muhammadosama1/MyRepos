//
//  UserReposProtocol.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public protocol UserReposProtocol {
    func getUserRepos(userName: String) async throws -> [Repo]
}
