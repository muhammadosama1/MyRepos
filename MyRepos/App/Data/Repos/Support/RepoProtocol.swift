//
//  RepoProtocol.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public protocol Repository {
    var session: URLSession { get }
    var baseURL: String { get }
}

public extension Repository {
    var baseURL: String {
        return "https://api.github.com/"
    }
}
