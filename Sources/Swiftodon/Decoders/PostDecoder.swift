//
//  PostDecoder.swift
//
//
//  Created by Pingu on 23.12.23.
//

extension Post: Decodable {
    
    private enum PostCodingKeys: String, CodingKey {
        case id = "id"//
        /// web
        case postURL = "url"//
        case postURI = "uri"//
        
        /// visibility & cw
        case visibility = "visibility"//
        case sensitive = "sensitive"//
        
        /// post counts
        case repliesCount = "replies_count"//
        case reblogsCount = "reblogs_count"//
        case favouritesCount = "favourites_count"//
        
        /// time stamps
        case createdAt = "created_at"//
        case editedAt = "edited_at"//
        
        case application = "application"//
        case account = "account"//
        case mentions = "mentions"//
        case language = "language"//
        
        /// contents
        case content = "content"//
        case text = "text"//
        case spoilerText = "spoiler_text"//
        case reblog = "reblog"
        
        case inReplyToStatusId = "in_reply_to_id"//
        case inReplyToAccountId = "in_reply_to_account_id"//
        
        /// user preferences
        case favourited = "favourited"//
        case reblogged = "reblogged"//
        case muted = "muted"//
        case bookmarked = "bookmarked"//
        case pinned = "pinned"//
        case filtered = "filtered"//
        
        case mediaAttachments = "media_attachments"//
        case tags = "tags"//
        case emojis = "emojis"//
        case card = "card"//
        case poll = "poll"//
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: PostCodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        
        self.postURL = try? values.decode(String.self, forKey: .postURL)
        self.postURI = try values.decode(String.self, forKey: .postURI)
        
        self.visibility = try values.decode(Visibility.self, forKey: .visibility)
        self.sensitive = try values.decode(Bool.self, forKey: .sensitive)
        
        self.repliesCount = try values.decode(Int.self, forKey: .repliesCount)
        self.reblogsCount = try values.decode(Int.self, forKey: .reblogsCount)
        self.favouritesCount = try values.decode(Int.self, forKey: .favouritesCount)
        
        self.createdAt = try values.decode(String.self, forKey: .createdAt)
        self.editedAt = try? values.decode(String.self, forKey: .editedAt)
        
        self.application = try? values.decode(Application.self, forKey: .application)
        self.account = try values.decode(Account.self, forKey: .account)
        self.language = try values.decode(String.self, forKey: .language)
        
        self.content = try values.decode(String.self, forKey: .content)
        self.text = try? values.decode(String.self, forKey: .text)
        self.spoilerText = try values.decode(String.self, forKey: .spoilerText)
        self.reblog = try? values.decode(String.self, forKey: .reblog)
        self.mediaAttachments = try values.decode([MediaAttachment].self, forKey: .mediaAttachments)
        
        self.inReplyToStatusID = try? values.decode(String.self, forKey: .inReplyToStatusId)
        self.inReplyToAccountID = try? values.decode(String.self, forKey: .inReplyToAccountId)
        
        self.favourited = try? values.decode(Bool.self, forKey: .favourited)
        self.reblogged = try? values.decode(Bool.self, forKey: .reblogged)
        self.muted = try? values.decode(Bool.self, forKey: .muted)
        self.bookmarked = try? values.decode(Bool.self, forKey: .bookmarked)
        self.pinned = try? values.decode(Bool.self, forKey: .pinned)
        self.filtered = try? values.decode(Bool.self, forKey: .filtered)
        
        self.tags = try values.decode([Tag].self, forKey: .tags)
        self.emojis = try values.decode([Emoji].self, forKey: .emojis)
        self.mentions = try values.decode([Mention].self, forKey: .mentions)
        self.card = try? values.decode(Card.self, forKey: .card)
        self.poll = try? values.decode(Poll.self, forKey: .poll)
    }
}

