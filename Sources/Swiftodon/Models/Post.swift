//
//  Post.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

public struct Post: Identifiable {
    /// Unique post ID supplied by Mastodon
    public let id: UInt
    
    /// Post URLs
    public var postURL: String
    public var postURI: String
    
    /// post metadata
    public var visibility: Visibility
    public var repliesCount: Int
    public var reblogsCount: Int
    public var favouritesCount: Int
    public var createdAt: String
    public var editedAt: String?
    public var application: Application
    public var account: Account
    public var mentions: [String]
    
    /// Content of the post including attachments
    public var content: String
    public var isReblog: Bool
    public var mediaAttachmentsURLs: [String]
    public var tags: [Any]
    public var emojies: [Any]
    public var card: String?
    public var poll: String?
}

extension Post {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        /// web
        case postURL = "url"
        case postURI = "uri"
        /// metadata
        case visibility = "visibility"
        case repliesCount = "replies_count"
        case reblogsCount = "reblogs_count"
        case favouritesCount = "favourites_count"
        case createdAt = "created_at"
        case editedAt = "edited_at"
        case application = "application"
        case account = "account"
        case metions = "mentions"
        /// contents
        case content = "content"
        case isReplog = "reblog"
        case mediaAttachmentsURLs = "media_attachments"
        case tags = "tags"
        case emojies = "emojies"
        case card = "card"
        case poll = "poll"
    }
    
    /*sspublic init(from: Decoder) throws {
        
    }*/
}

public struct Application {
    /// Name of the instance
    public var name: String
    
    /// URL to the instance
    public var website: String
}

public enum Visibility {
    /// Post is public to all instances
    case `public`
    
    /// Post is public for the instance the user is on
    case community
    
    /// Post is only visible to own followers
    case `private`
}
