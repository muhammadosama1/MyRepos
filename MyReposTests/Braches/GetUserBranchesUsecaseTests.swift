//
//  GetUserBranchesUsecaseTests.swift
//  MyReposTests
//
//  Created by Muhammad Osama on 27/08/2025.
//

import XCTest
@testable import MyRepos

private class MockBranchesRepo: BranchesRepoProtocol {
    var result: Result<[Branch], Error> = .success([])
    
    func getRepoBranches(userName: String, repoName: String) async throws -> [Branch] {
        switch result {
        case .success(let branches):
            return branches
        case .failure(let error):
            throw error
        }
    }
}

final class GetUserBranchesUsecaseTests: XCTestCase {
    
    var usecase: GetUserBranchesUsecase!
    fileprivate var mockRepo: MockBranchesRepo!
    
    override func setUp() {
        mockRepo = MockBranchesRepo()
        usecase = GetUserBranchesUsecase(repo: mockRepo)
    }
    
    override func tearDown() {
        usecase = nil
        mockRepo = nil
    }
    
    @MainActor
    func test_execute_returnsBranches() async throws {
        // Given
        let branches = createTestBranches()
        mockRepo.result = .success(branches)
        
        // When
        let result = try await usecase.execute(userName: "testUser", repoName: "testRepo")
        
        // Then
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.first?.name, "main")
    }
    
    func test_execute_returnsEmptyArray() async throws {
        // Given
        mockRepo.result = .success([])
        
        // When
        let result = try await usecase.execute(userName: "testUser", repoName: "testRepo")
        
        // Then
        XCTAssertTrue(result.isEmpty)
    }
    
    private func createTestBranches() -> [Branch] {
        let commit1 = Commit(sha: "abc123", url: "https://api.github.com/commits/abc123")
        let commit2 = Commit(sha: "def456", url: "https://api.github.com/commits/def456")
        
        return [
            Branch(name: "main", commit: commit1, protected: true),
            Branch(name: "develop", commit: commit2, protected: false)
        ]
    }
}
