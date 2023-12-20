//
//  Account.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

public struct Account {
    public let id: UInt
    public var username: String
    public var acct: String
    public var displayName: String
    public let locked: Bool
    public let bot: Bool
    public let discoverable: Bool
    public let group: Bool
    public var note: String
    public let url: String
    public let uri: String
    public var avatarImageURL: String
    public var avatarStaticURL: String
    public var headerImageURL: String
    public var headerImageStatic: String
    public var followersCount: Int
    public var followingCount: Int
    public var statusesAccount: Int
    public var lastStatusAt: String
    public let noIndex: Bool
    public var emojis: [Any]
    public var roles: [Any]
    public var fields: [Any]
}
