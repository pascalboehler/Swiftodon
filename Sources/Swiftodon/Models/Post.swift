//
//  Post.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

public struct Post: Identifiable {
    public let id: UInt
    public var visibility: Visibility
    public var postURL: String
    public var postURI: String
    public var repliesCount: Int
    public var reblogsCount: Int
    public var favouritesCount: Int
    public var editedAt: String?
    public var content: String
    public var isReblog: Bool
    public var application: Application
    public var account: Account
    public var mediaAttechmentsURLs: [String]
    public var mentions: [String]
    public var tags: [Any]
    public var emojies: [Any]
    public var card: String?
    public var poll: String?
}

public struct Application {
    public var name: String
    public var website: String
}

public enum Visibility {
    case isPublic
    case community
    case isPrivate
}
