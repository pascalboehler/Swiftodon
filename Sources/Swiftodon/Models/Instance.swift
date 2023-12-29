//
//  Instance.swift
//
//
//  Created by Pingu on 23.12.23.
//

import Foundation

public class Instance {
    public var instanceURL: String
    public var isAuthenticated: Bool
    
    public init(instanceURL: String, isAuthenticated: Bool) {
        self.instanceURL = instanceURL
        self.isAuthenticated = isAuthenticated
    }
    
    /// Authenticate device against server to gain access and login user
    public func authenticateDevice() -> Bool {
        return false
    }
}
