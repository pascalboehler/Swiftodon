//
//  Post.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

struct Post: Identifiable {
    let id: UInt
    var visibility: Visibility
    var postURL: String
    var postURI: String
    var repliesCount: Int
    var reblogsCount: Int
    var favouritesCount: Int
    var editedAt: String?
    var content: String
    var isReblog: Bool
    var application: Application
    var account: Account
    var mediaAttechmentsURLs: [String]
    var mentions: [String]
    var tags: [Any]
    var emojies: [Any]
    var card: String?
    var poll: String?
}

struct Application {
    var name: String
    var website: String
}

enum Visibility {
    case isPublic
    case community
    case isPrivate
}
