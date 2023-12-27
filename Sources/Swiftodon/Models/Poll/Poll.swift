//
//  Poll.swift
//
//
//  Created by Pingu on 27.12.23.
//

import Foundation

public struct Poll {
    public var id: String
    
    public var expiresAt: String?
    public var expired: Bool
    
    public var multipleChoice: Bool
    
    public var votesCount: Int
    public var votersCount: Int?
    public var options: [PollOption]
    
    /// Own user data
    public var voted: Bool?
    public var ownVotes: [Int]?
    /// extra data
    public var emojis: [Emoji]
}
