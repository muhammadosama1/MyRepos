//
//  Commit.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct Commit {
    let sha: String
    let url: String
    
    public init(
        sha: String,
        url: String
    ) {
        self.sha = sha
        self.url = url
    }
}
