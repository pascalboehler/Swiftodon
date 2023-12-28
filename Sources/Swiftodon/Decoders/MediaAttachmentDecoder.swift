//
//  MediaAttachmentDecoder.swift
//
//
//  Created by Pingu on 28.12.23.
//

import Foundation

extension MediaAttachment: Decodable {
    enum MediaAttachmentJSONKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        
        case url = "url"
        case previewURL = "preview_url"
        case remoteURL = "remote_url"
        
        case meta = "meta"
        
        case description = "description"
        case blurhash = "blurhash"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: MediaAttachmentJSONKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.type = try values.decode(MediaAttachmentType.self, forKey: .type)
        
        self.url = try values.decode(String.self, forKey: .url)
        self.previewURL = try values.decode(String.self, forKey: .previewURL)
        self.remoteURL = try? values.decode(String.self, forKey: .remoteURL)
        
        self.meta = try? values.decode([String: String].self, forKey: .meta)
        
        self.description = try? values.decode(String.self, forKey: .description)
        self.blurhash = try? values.decode(String.self, forKey: .blurhash)
    }
}
