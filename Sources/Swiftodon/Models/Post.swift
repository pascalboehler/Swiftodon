//
//  Post.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

public struct Post: Identifiable {
    /// Unique post ID supplied by Mastodon
    public let id: UInt?
    
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

public struct Application {
    /// Name of the instance
    public var name: String
    
    /// URL to the instance
    public var website: String
}

public enum Visibility: String, Codable {
    /// Post is public to all instances
    case `public` = "public"
    
    /// Post is public for the instance the user is on
    case community = "community"
    
    /// Post is only visible to own followers
    case `private` = "private"
}
