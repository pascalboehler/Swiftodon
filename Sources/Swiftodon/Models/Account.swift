//
//  Account.swift
//
//
//  Created by Pingu on 20.12.23.
//

import Foundation

struct Account {
    let id: UInt
    var username: String
    var acct: String
    var displayName: String
    let locked: Bool
    let bot: Bool
    let discoverable: Bool
    let group: Bool
    var note: String
    let url: String
    let uri: String
    var avatarImageURL: String
    var avatarStaticURL: String
    var headerImageURL: String
    var headerImageStatic: String
    var followersCount: Int
    var followingCount: Int
    var statusesAccount: Int
    var lastStatusAt: String
    let noIndex: Bool
    var emojis: [Any]
    var roles: [Any]
    var fields: [Any]
}
