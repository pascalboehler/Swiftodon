//
//  FieldDecoder.swift
//
//
//  Created by Pingu on 25.12.23.
//

import Foundation

extension Field: Decodable {
    
    enum FieldJSONKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case verifiedAt = "verified_at"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: FieldJSONKeys.self)
        
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawValue = try? values.decode(String.self, forKey: .value)
        let rawVerifiedAt = try? values.decode(String.self, forKey: .verifiedAt)
        
        guard let name = rawName else {
            throw DecodingError.dataCorruptedError(forKey: .name, in: values, debugDescription: "Not found")
        }
        self.name = name
        guard let value = rawValue else {
            throw DecodingError.dataCorruptedError(forKey: .value, in: values, debugDescription: "Not found")
        }
        self.value = value
        self.verifiedAt = rawVerifiedAt
    }
}
