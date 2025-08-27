//
//  ViewState.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public enum ViewState<T: Sendable>: Sendable {
    case idle
    case loading
    case loaded(T)
    case error(Error)
    
    public var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
}
