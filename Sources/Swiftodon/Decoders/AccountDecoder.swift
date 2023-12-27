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
        case acct = "acct"
        case displayName = "display_name"
        
        case locked = "locked"
        case bot = "bot"
        case discoverable = "discoverable"
        case group = "group"
        case note = "note"
        
        case url = "url"
        case uri = "uri"
        
        case avatarImageURL = "avatar"
        case avatarStaticURL = "avatar_static"
        case headerImageURL = "header"
        case headerStaticURL = "header_static"
        
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case statusesCount = "statuses_count"
        case lastStatusAt = "last_status_at"
        case noIndex = "noindex"
        case emojis = "emojis"
        case roles = "roles"
        case fields = "fields"
    }
    
    public init(from: Decoder) throws {
        let values = try from.container(keyedBy: AccountJSONKeys.self)
        
        let rawId = try? values.decode(String.self, forKey: .id)
        
        let rawUsername = try? values.decode(String.self, forKey: .username)
        let rawAcct = try? values.decode(String.self, forKey: .acct)
        let rawDisplayName = try? values.decode(String.self, forKey: .displayName)
        
        let rawLocked = try? values.decode(Bool.self, forKey: .locked)
        let rawBot = try? values.decode(Bool.self, forKey: .bot)
        let rawDiscoverable = try? values.decode(Bool.self, forKey: .discoverable)
        let rawGroup = try? values.decode(Bool.self, forKey: .group)
        let rawNote = try? values.decode(String.self, forKey: .note)
        
        let rawURL = try? values.decode(String.self, forKey: .url)
        let rawURI = try? values.decode(String.self, forKey: .uri)
        
        let rawAvaterImageURL = try? values.decode(String.self, forKey: .avatarImageURL)
        let rawAvaterStaticURL = try? values.decode(String.self, forKey: .avatarStaticURL)
        let rawHeaderImageURL = try? values.decode(String.self, forKey: .headerImageURL)
        let rawHeaderStaticURL = try? values.decode(String.self, forKey: .headerStaticURL)
        
        let rawFollowersCount = try? values.decode(Int.self, forKey: .followersCount)
        let rawFollowingCount = try? values.decode(Int.self, forKey: .followingCount)
        let rawStatusesCount = try? values.decode(Int.self, forKey: .statusesCount)
        let rawLastStatusAt = try? values.decode(String.self, forKey: .lastStatusAt)
        let rawNoIndex = try? values.decode(Bool.self, forKey: .noIndex)
        
        let rawEmojis = try? values.decode([String].self, forKey: .emojis)
        let rawRoles = try? values.decode([String].self, forKey: .roles)
        let rawFields = try? values.decode([Field].self, forKey: .fields)
        
        guard let id = rawId else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: values, debugDescription: "Not found")
        }
        self.id = id
        
        guard let username = rawUsername else {
            throw DecodingError.dataCorruptedError(forKey: .username, in: values, debugDescription: "Not found")
        }
        self.username = username
        guard let acct = rawAcct else {
            throw DecodingError.dataCorruptedError(forKey: .acct, in: values, debugDescription: "Not found")
        }
        self.acct = acct
        guard let displayName = rawDisplayName else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: values, debugDescription: "Not found")
        }
        self.displayName = displayName
        
        guard let locked = rawLocked else {
            throw DecodingError.dataCorruptedError(forKey: .locked, in: values, debugDescription: "Not found")
        }
        self.locked = locked
        guard let bot = rawBot else {
            throw DecodingError.dataCorruptedError(forKey: .bot, in: values, debugDescription: "Not found")
        }
        self.bot = bot
        guard let discoverable = rawDiscoverable else {
            throw DecodingError.dataCorruptedError(forKey: .discoverable, in: values, debugDescription: "Not found")
        }
        self.discoverable = discoverable
        guard let group = rawGroup else {
            throw DecodingError.dataCorruptedError(forKey: .group, in: values, debugDescription: "Not found")
        }
        self.group = group
        guard let note = rawNote else {
            throw DecodingError.dataCorruptedError(forKey: .note, in: values, debugDescription: "Not found")
        }
        self.note = note
        
        guard let url = rawURL else {
            throw DecodingError.dataCorruptedError(forKey: .url, in: values, debugDescription: "Not found")
        }
        self.url = url
        guard let uri = rawURI else {
            throw DecodingError.dataCorruptedError(forKey: .uri, in: values, debugDescription: "Not found")
        }
        self.uri = uri
        
        guard let avaterImageURL = rawAvaterImageURL else {
            throw DecodingError.dataCorruptedError(forKey: .avatarImageURL, in: values, debugDescription: "Not found")
        }
        self.avatarImageURL = avaterImageURL
        guard let avatarStaticURL = rawAvaterStaticURL else {
            throw DecodingError.dataCorruptedError(forKey: .avatarStaticURL, in: values, debugDescription: "Not found")
        }
        self.avatarStaticURL = avatarStaticURL
        guard let headerImageURL = rawHeaderImageURL else {
            throw DecodingError.dataCorruptedError(forKey: .headerImageURL, in: values, debugDescription: "Not found")
        }
        self.headerImageURL = headerImageURL
        guard let headerStaticURL = rawHeaderStaticURL else {
            throw DecodingError.dataCorruptedError(forKey: .headerStaticURL, in: values, debugDescription: "Not found")
        }
        self.headerStaticURL = headerStaticURL
        
        guard let followersCount = rawFollowersCount else {
            throw DecodingError.dataCorruptedError(forKey: .followersCount, in: values, debugDescription: "Not found")
        }
        self.followersCount = followersCount
        guard let followingCount = rawFollowingCount else {
            throw DecodingError.dataCorruptedError(forKey: .followingCount, in: values, debugDescription: "Not found")
        }
        self.followingCount = followingCount
        guard let statusesCount = rawStatusesCount else {
            throw DecodingError.dataCorruptedError(forKey: .statusesCount, in: values, debugDescription: "Not found")
        }
        self.statusesCount = statusesCount
        guard let lastStatusAt = rawLastStatusAt else {
            throw DecodingError.dataCorruptedError(forKey: .statusesCount, in: values, debugDescription: "Not found")
        }
        self.lastStatusAt = lastStatusAt
        guard let noIndex = rawNoIndex else {
            throw DecodingError.dataCorruptedError(forKey: .noIndex, in: values, debugDescription: "Not found")
        }
        self.noIndex = noIndex
        
        guard let emojis = rawEmojis else {
            throw DecodingError.dataCorruptedError(forKey: .emojis, in: values, debugDescription: "Not found")
        }
        self.emojis = emojis
        guard let roles = rawRoles else {
            throw DecodingError.dataCorruptedError(forKey: .roles, in: values, debugDescription: "Not found")
        }
        self.roles = roles
        guard let fields = rawFields else {
            throw DecodingError.dataCorruptedError(forKey: .fields, in: values, debugDescription: "Not found")
        }
        self.fields = fields
    }
}
