//
//  PublicGetTests.swift
//  
//
//  Created by Pingu on 24.12.23.
//

import XCTest
@testable import Swiftodon

final class PublicGetTests: XCTestCase {
    func testPublicGetAll() async throws {
        let myInstance = Instance(instanceURL: "mastodon.social", isAuthenticated: true)
        
        let publicPostsResponse = try await myInstance.fetchAllPublicPosts()
        
        guard let publicPosts = publicPostsResponse else {
            XCTFail("array returned is nil")
            return
        }
        
        XCTAssert(!publicPosts.isEmpty)
        
    }
}
