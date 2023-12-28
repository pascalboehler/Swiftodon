//
//  CardDecoder.swift
//  
//
//  Created by Pingu on 28.12.23.
//

import Foundation

extension Card: Decodable {
    enum CardJSONKeys: String, CodingKey {
        case url = "url"
        case title = "title"
        case description = "description"
        case type = "type"
        case authorName = "author_name"
        case authorURL = "author_url"
        case providerName = "provider_name"
        case providerURL = "provider_url"
        case html = "html"
        case width = "width"
        case height = "height"
        case previewImageURL = "image"
        case embedURL = "embed_url"
        case blurhash = "blurhash"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CardJSONKeys.self)
        
        self.url = try values.decode(String.self, forKey: .url)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decode(String.self, forKey: .description)
        
        self.type = try values.decode(CardType.self, forKey: .type)
        
        self.authorName = try values.decode(String.self, forKey: .authorName)
        self.authorURL = try values.decode(String.self, forKey: .authorURL)
        self.providerName = try values.decode(String.self, forKey: .providerName)
        self.providerURL = try values.decode(String.self, forKey: .providerURL)
        
        self.html = try values.decode(String.self, forKey: .html)
        
        self.width = try values.decode(Int.self, forKey: .width)
        self.height = try values.decode(Int.self, forKey: .height)
        
        self.previewImageURL = try? values.decode(String.self, forKey: .previewImageURL)
        self.embedURL = try values.decode(String.self, forKey: .embedURL)
        self.blurhash = try? values.decode(String.self, forKey: .blurhash)
    }
    
}
