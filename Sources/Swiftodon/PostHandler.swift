//
//  PostHandler.swift
//
//
//  Created by Pingu on 23.12.23.
//

import Foundation
import Alamofire

extension Instance {
    @available(iOS 13.0.0, *)
    @available(macOS 10.15, *)
    public func fetchAllPublicPosts(amount: Int) async throws -> [Post]? {
        let rawCallURL = "https://\(instanceURL)/api/v1/timelines/public?limit=\(amount)"
       
        let response = await AF.request(rawCallURL).serializingDecodable([Post].self).response
        let value = response.value
        
        return value
    }
}
