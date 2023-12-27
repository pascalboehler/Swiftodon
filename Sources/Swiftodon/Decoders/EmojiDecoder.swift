//
//  EmojiDecoder.swift
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
        case visibleInPicker = "visible_in_picker"
        case category = "category"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: EmojiJSONKeys.self)
        self.shortcode = try values.decode(String.self, forKey: .shortcode)
        self.url = try values.decode(String.self, forKey: .url)
        self.staticURL = try values.decode(String.self, forKey: .staticURL)
        self.visibleInPicker = try values.decode(Bool.self, forKey: .visibleInPicker)
        self.category = try values.decode(String.self, forKey: .category)
    }
}
