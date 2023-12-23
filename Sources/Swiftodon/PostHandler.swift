//
//  PostHandler.swift
//
//
//  Created by Pingu on 23.12.23.
//

import Foundation

extension Instance {
    public func fetchAllPublicPosts() -> [Post]? {
        
        let callURL = URL(string: "https://\(instanceURL)/api/v1/timelines/public?limit=10")
        
        guard let callURL = callURL else {
            return nil
        }
        
        var request = URLRequest(url: callURL)
        request.httpMethod = "GET"
        
        
        
        return nil
    }
}
