//
//  PollOptionDecoder.swift
//
//
//  Created by Pingu on 27.12.23.
//

import Foundation

extension PollOption: Decodable {
    enum PollOptionsJSONKeys: String, CodingKey {
        case title = "title"
        case votesCount = "votes_count"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PollOptionsJSONKeys.self)
        self.title = try values.decode(String.self, forKey: .title)
        self.votesCount = try values.decode(Int.self, forKey: .votesCount)
    }
}
