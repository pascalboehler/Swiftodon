//
//  File.swift
//  
//
//  Created by Pingu on 25.12.23.
//

import Foundation

extension Tag: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: TagJSONKeys.self)
        
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawURL = try? values.decode(String.self, forKey: .url)
        
        guard let name = rawName else {
            throw DecodingError.dataCorruptedError(forKey: .name, in: values, debugDescription: "Not found")
        }
        self.name = name
        guard let url = rawURL else {
            throw DecodingError.dataCorruptedError(forKey: .url, in: values, debugDescription: "Not found")
        }
        self.url = url
    }
    
    
    enum TagJSONKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    
}
