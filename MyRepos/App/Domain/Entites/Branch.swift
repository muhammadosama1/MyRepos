//
//  Branch.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public struct Branch {
    let name: String
    let commit: Commit
    let protected: Bool
    
    public init(
        name: String,
        commit: Commit,
        protected: Bool
    ) {
        self.name = name
        self.commit = commit
        self.protected = protected
    }
}
