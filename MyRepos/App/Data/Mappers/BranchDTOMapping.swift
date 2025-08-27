//
//  Untitled.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public extension BranchDTO {
    func mapping() -> Branch {
        return Branch(
            name: name,
            commit: commit.mapping(),
            protected: protected
        )
    }
}
