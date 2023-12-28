//
//  AccountDecoder.swift
//
//
//  Created by Pingu on 23.12.23.
//

import Foundation

extension Account: Decodable {
    
    enum AccountJSONKeys: String, CodingKey {
        case id = "id"
        
        case username = "username"
        case accountName = "acct"
        case displayName = "display_name"
        
        case locked = "locked"
        case bot = "bot"
        case discoverable = "discoverable"
        case group = "group"
        case note = "note"
        
        case url = "url"
        
        case avatarImageURL = "avatar"
        case avatarStaticURL = "avatar_static"
        case headerImageURL = "header"
        case headerStaticURL = "header_static"
        
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case statusesCount = "statuses_count"
        case lastStatusAt = "last_status_at"
        case createdAt = "created_at"
        
        case noIndex = "noindex"
        case moved = "moved"
        case suspended = "suspended"
        case limited = "limited"
        
        case emojis = "emojis"
        case fields = "fields"
    }
    
    public init(from: Decoder) throws {
        let values = try from.container(keyedBy: AccountJSONKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        
        self.username = try values.decode(String.self, forKey: .username)
        self.accountName = try values.decode(String.self, forKey: .accountName)
        self.displayName = try values.decode(String.self, forKey: .displayName)
        
        self.url = try values.decode(String.self, forKey: .url)
        
        self.note = try values.decode(String.self, forKey: .note)
        
        self.avatarImageURL = try values.decode(String.self, forKey: .avatarImageURL)
        self.avatarStaticURL = try values.decode(String.self, forKey: .avatarStaticURL)
        self.headerImageURL = try values.decode(String.self, forKey: .headerImageURL)
        self.headerStaticURL = try values.decode(String.self, forKey: .headerStaticURL)
        
        self.locked = try values.decode(Bool.self, forKey: .locked)
        self.bot = try values.decode(Bool.self, forKey: .bot)
        self.group = try? values.decode(Bool.self, forKey: .group)
        self.discoverable = try? values.decode(Bool.self, forKey: .discoverable)
        self.noIndex = try? values.decode(Bool.self, forKey: .noIndex)
        self.moved = try? values.decode(Bool.self, forKey: .moved)
        self.limited = try? values.decode(Bool.self, forKey: .limited)
        self.suspended = try? values.decode(Bool.self, forKey: .suspended)
        
        self.createdAt = try values.decode(String.self, forKey: .createdAt)
        self.lastStatusAt = try? values.decode(String.self, forKey: .lastStatusAt)
        
        self.followersCount = try values.decode(Int.self, forKey: .followersCount)
        self.followingCount = try values.decode(Int.self, forKey: .followingCount)
        self.statusesCount = try values.decode(Int.self, forKey: .statusesCount)
        
        self.fields = try values.decode([Field].self, forKey: .fields)
        self.emojis = try values.decode([Emoji].self, forKey: .emojis)
        
    }
}
