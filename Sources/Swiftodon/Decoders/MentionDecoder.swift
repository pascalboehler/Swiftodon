//
//  File.swift
//  
//
//  Created by Pingu on 27.12.23.
//

import Foundation

extension Mention: Decodable {
    enum MentionJSONKeys : String, CodingKey{
        case id = "id"
        case username = "username"
        case url = "url"
        case acct = "acct"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MentionJSONKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.username = try values.decode(String.self, forKey: .username)
        self.url = try values.decode(String.self, forKey: .url)
        self.acct = try values.decode(String.self, forKey: .acct)
    }
}
