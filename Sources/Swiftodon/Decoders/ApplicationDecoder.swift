//
//  ApplicationDecoder.swift
//  
//
//  Created by Pingu on 23.12.23.
//

import Foundation

extension Application: Decodable {
    
    enum ApplicationJSONTokens: String, CodingKey {
        case name = "name"
        case website = "website"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ApplicationJSONTokens.self)
        
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawWebsite = try? values.decode(String.self, forKey: .website)
        
        guard let name = rawName else {
            throw DecodingError.dataCorruptedError(forKey: .name, in: values, debugDescription: "Not found")
        }
        self.name = name
        guard let website = rawWebsite else {
            throw DecodingError.dataCorruptedError(forKey: .website, in: values, debugDescription: "Not found")
        }
        self.website = website
    }
}
