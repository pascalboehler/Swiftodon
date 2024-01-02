//
//  Instance.swift
//
//
//  Created by Pingu on 23.12.23.
//

import Foundation
import Alamofire

public class Instance {
    public var instanceURL: String
    public var isAuthenticated: Bool
    
    private var clientSecret: String = ""
    private var clientId: String = ""
    
    public init(instanceURL: String, isAuthenticated: Bool) {
        self.instanceURL = instanceURL
        self.isAuthenticated = isAuthenticated
    }
    
    /// Authenticate device against server to gain access and login user
    @available(iOS 13.0.0, *)
    @available(macOS 10.15, *)
    public func authenticateApplication(for appName: String = "Swiftodon-Package-Test", website: String = "https://test.example") async throws -> Bool {
        
        let params = ["client_name": "\(appName)", "redirect_uris": "urn:ietf:wg:oauth:2.0:oob", "scopes": "read write push", "website": "\(website)"]
        
        let response = try await AF.request("https://\(instanceURL)/api/v1/apps", method: .post, parameters: params, encoder: URLEncodedFormParameterEncoder.default).serializingString().value
        
        print(response)
        
        return false
    }
}
