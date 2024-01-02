//
//  File.swift
//  
//
//  Created by Pingu on 30.12.23.
//

import XCTest
@testable import Swiftodon

final class AuthenticationTests: XCTestCase {
    
    func testApplicationAccessRequest() async throws {
        let myInstance = Instance(instanceURL: "mastodon.social", isAuthenticated: false)
        
        let isAuthenticated = try await myInstance.authenticateApplication(for: "App Test")
        
        XCTAssert(isAuthenticated)
        
    }
}
