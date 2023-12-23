//
//  Instance.swift
//
//
//  Created by Pingu on 23.12.23.
//

import Foundation

class Instance {
    var instanceURL: String
    var isAuthenticated: Bool
    
    init(instanceURL: String, isAuthenticated: Bool) {
        self.instanceURL = instanceURL
        self.isAuthenticated = isAuthenticated
    }
    
    /// Authenticate device against server to gain access and login user
    func authenticateDevice() -> Bool {
        return false
    }
}
