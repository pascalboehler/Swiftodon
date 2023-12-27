//
//  File.swift
//  
//
//  Created by Pingu on 27.12.23.
//

import Foundation

extension Poll: Decodable {
    enum PollJSONKeys: String, CodingKey {
        case id = "id"
        case expiresAt = "expires_at"
        case expired = "expired"
        case multipleChoice = "multiple"
        case votesCount = "votes_count"
        case votersCount = "voters_count"
        case options = "options"
        case emojis = "emojis"
        case voted = "voted"
        case ownVotes = "own_votes"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PollJSONKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.expiresAt = try? values.decode(String.self, forKey: .expiresAt)
        self.expired = try values.decode(Bool.self, forKey: .expired)
        self.multipleChoice = try values.decode(Bool.self, forKey: .multipleChoice)
        self.votesCount = try values.decode(Int.self, forKey: .votesCount)
        self.votersCount = try? values.decode(Int.self, forKey: .votersCount)
        self.options = try values.decode([PollOption].self, forKey: .options)
        self.emojis = try values.decode([Emoji].self, forKey: .emojis)
        self.voted = try? values.decode(Bool.self, forKey: .voted)
        self.ownVotes = try? values.decode([Int].self, forKey: .ownVotes)
    }
    
}
