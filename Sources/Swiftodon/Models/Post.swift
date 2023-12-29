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
    public var postURL: String? /// link to status representation
    public var postURI: String
    
    /// post metadata
    public var visibility: Visibility
    public var sensitive: Bool
    
    /// counts
    public var repliesCount: Int
    public var reblogsCount: Int
    public var favouritesCount: Int
    
    /// timestamps
    public var createdAt: String
    public var editedAt: String?
    
    /// metadata about creator
    public var application: Application?
    public var account: Account
    public var language: String?
    
    /// Content of the post including attachments
    public var content: String /// html
    public var text: String?
    public var spoilerText: String
    public var reblog: String?
    public var mediaAttachments: [MediaAttachment]
        
    /// Replies
    public var inReplyToStatusID: String?
    public var inReplyToAccountID: String?
    
    /// User status
    public var favourited: Bool
    public var reblogged: Bool
    public var muted: Bool?
    public var bookmarked: Bool?
    public var pinned: Bool?
    public var filtered: Bool?
    
    /// Additional data
    public var tags: [Tag]
    public var emojis: [Emoji]
    public var mentions: [Mention]
    public var card: Card?
    public var poll: Poll?
}
