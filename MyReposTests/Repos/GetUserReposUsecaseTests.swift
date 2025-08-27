//
//  GetUserReposUsecaseTests.swift
//  MyReposTests
//
//  Created by Muhammad Osama on 27/08/2025.
//

import XCTest
@testable import MyRepos

private class MockUserReposRepo: UserReposProtocol {
    var result: Result<[Repo], Error> = .success([])
    
    func getUserRepos(userName: String) async throws -> [Repo] {
        switch result {
        case .success(let repos):
            return repos
        case .failure(let error):
            throw error
        }
    }
}

final class GetUserReposUsecaseTests: XCTestCase {
    
    var usecase: GetUserReposUsecase!
    fileprivate var mockRepo: MockUserReposRepo!
    
    override func setUp() {
        mockRepo = MockUserReposRepo()
        usecase = GetUserReposUsecase(repo: mockRepo)
    }
    
    override func tearDown() {
        usecase = nil
        mockRepo = nil
    }
    
    @MainActor
    func test_execute_returnsRepos() async throws {
        // Given
        let repos = createTestRepos()
        mockRepo.result = .success(repos)
        
        // When
        let result = try await usecase.execute(userName: "testUser")
        
        // Then
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.first?.name, "TestRepo")
        XCTAssertEqual(result.first?.id, 12345)
    }
    
    func test_execute_returnsEmptyArray() async throws {
        // Given
        mockRepo.result = .success([])
        
        // When
        let result = try await usecase.execute(userName: "testUser")
        
        // Then
        XCTAssertTrue(result.isEmpty)
    }
    
    
    private func createTestRepos() -> [Repo] {
        let owner = Owner(id: 67890, avatarURL: "https://avatars.githubusercontent.com/u/67890?v=4")
        
        return [
            Repo(
                id: 12345,
                name: "TestRepo",
                fullName: "testUser/TestRepo",
                owner: owner,
                description: "A test repository",
                fork: false,
                createdAt: "2025-01-01T00:00:00Z",
                updatedAt: "2025-01-02T00:00:00Z",
                stargazersCount: 100,
                watchersCount: 100,
                forksCount: 25,
                forks: 25,
                openIssues: 5,
                watchers: 100,
                defaultBranch: "main"
            ),
            Repo(
                id: 67890,
                name: "AnotherRepo",
                fullName: "testUser/AnotherRepo",
                owner: owner,
                description: "Another test repository",
                fork: true,
                createdAt: "2025-01-03T00:00:00Z",
                updatedAt: "2025-01-04T00:00:00Z",
                stargazersCount: 50,
                watchersCount: 50,
                forksCount: 10,
                forks: 10,
                openIssues: 2,
                watchers: 50,
                defaultBranch: "develop"
            )
        ]
    }
}
