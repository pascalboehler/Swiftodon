//
//  Post.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

public struct Post: Identifiable {
    /// Unique post ID supplied by Mastodon
    public let id: String
    
    /// Post URLs
    public var postURL: String?
    public var postURI: String
    
    /// post metadata
    public var visibility: Visibility
    public var sensitive: Bool
    
    /// counts
    public var repliesCount: Int
    public var reblogsCount: Int
    public var favouritesCount: Int
    
    public var createdAt: String
    public var editedAt: String?
    public var application: Application?
    public var account: Account
    public var mentions: [Mention]
    public var language: String?
    
    /// Content of the post including attachments
    public var content: String
    public var spoilerText: String
    public var reblog: String?
    public var mediaAttachmentsURLs: [String]
        
    /// Replies
    public var inReplyToStatusID: String?
    public var inReplyToAccountID: String?
    
    
    /// Additional data
    public var tags: [Tag]
    public var emojis: [Emoji]
    public var card: String?
    public var poll: Poll?
}
