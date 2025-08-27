//
//  NetworkErrors.swift
//  MyRepos
//
//  Created by Muhammad Osama on 27/08/2025.
//

import Foundation

public enum NetworkErrors: Error {
    case unauthorized
    case badURL
    case decodingFailed
}
