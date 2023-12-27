//
//  Emoji.swift
//
//
//  Created by Pingu on 26.12.23.
//

import Foundation

extension Emoji: Decodable {
    
    enum EmojiJSONKeys: String, CodingKey {
        case shortcode = "shortcode"
        case url = "url"
        case staticURL = "static_url"
    }
    
    init(from decoder: Decoder) throws {
        <#code#>
    }
}
