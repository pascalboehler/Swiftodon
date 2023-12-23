//
//  PostDecoder.swift
//
//
//  Created by Pingu on 23.12.23.
//

extension Post {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        /// web
        case postURL = "url"
        case postURI = "uri"
        /// metadata
        case visibility = "visibility"
        case repliesCount = "replies_count"
        case reblogsCount = "reblogs_count"
        case favouritesCount = "favourites_count"
        case createdAt = "created_at"
        case editedAt = "edited_at"
        case application = "application"
        case account = "account"
        case mentions = "mentions"
        /// contents
        case content = "content"
        case isReplog = "reblog"
        case mediaAttachmentsURLs = "media_attachments"
        case tags = "tags"
        case emojies = "emojies"
        case card = "card"
        case poll = "poll"
    }
    
    public init(from: Decoder) throws {
        let values = try from.container(keyedBy: CodingKeys.self)
        let rawID = try? values.decode(UInt.self, forKey: .id)
        let rawPostURL = try? values.decode(String.self, forKey: .postURL)
        let rawPostURI = try? values.decode(String.self, forKey: .postURI)
        let rawVisibility = (try? values.decode(String.self, forKey: .visibility)) ?? "public"
        let rawRepliesCount = try? values.decode(Int.self, forKey: .repliesCount)
        let rawReblogsCount = try? values.decode(Int.self, forKey: .reblogsCount)
        let rawFavouritesCount = try? values.decode(Int.self, forKey: .favouritesCount)
        let rawCreatedAt = try? values.decode(String.self, forKey: .createdAt)
        let rawEditedAt = try? values.decode(String.self, forKey: .editedAt)
        let rawApplication = try? values.decode(Application.self, forKey: .application)
        let rawAccount = try? values.decode(Account.self, forKey: .account)
        let rawMentions = try? values.decode([String].self, forKey: .mentions)
        let rawContent = try? values.decode(String.self, forKey: .content)
        let rawIsReblog = try? values.decode(Bool.self, forKey: .isReplog)
        let rawMediaAttachmentsURLs = try? values.decode([String].self, forKey: .mediaAttachmentsURLs)
        let rawTags = try? values.decode([String].self, forKey: .tags)
        let rawEmojies = try? values.decode([String].self, forKey: .emojies)
        let rawCard = try? values.decode(String.self, forKey: .card)
        let rawPoll = try? values.decode(String.self, forKey: .poll)

        guard let id = rawID else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: values, debugDescription: "ID is not a valid UInt")
        }
        
        guard let postURL = rawPostURL else {
            throw DecodingError.dataCorruptedError(forKey: .postURL, in: values, debugDescription: "postURL is not a valid URL")
        }

        guard let postURI = rawPostURI else {
            throw DecodingError.dataCorruptedError(forKey: .postURI, in: values, debugDescription: "postURI is not a valid URL")
        }

        guard let visibility = Visibility(rawValue: rawVisibility) else {
            throw DecodingError.dataCorruptedError(forKey: .visibility, in: values, debugDescription: "visibility is not a valid Visibility")
        }

        guard let repliesCount = rawRepliesCount else {
            throw DecodingError.dataCorruptedError(forKey: .repliesCount, in: values, debugDescription: "repliesCount is not a valid Int")
        }

        guard let reblogsCount = rawReblogsCount else {
            throw DecodingError.dataCorruptedError(forKey: .reblogsCount, in: values, debugDescription: "reblogsCount is not a valid Int")
        }

        guard let favouritesCount = rawFavouritesCount else {
            throw DecodingError.dataCorruptedError(forKey: .favouritesCount, in: values, debugDescription: "favouritesCount is not a valid Int")
        }

        guard let createdAt = rawCreatedAt else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt, in: values, debugDescription: "createdAt is not a valid String")
        }

        guard let editedAt = rawEditedAt else {
            throw DecodingError.dataCorruptedError(forKey: .editedAt, in: values, debugDescription: "editedAt is not a valid String")
        }

        guard let application = rawApplication else {
            throw DecodingError.dataCorruptedError(forKey: .application, in: values, debugDescription: "application is not a valid Application")
        }

        guard let account = rawAccount else {
            throw DecodingError.dataCorruptedError(forKey: .account, in: values, debugDescription: "account is not a valid Account")
        }

        guard let mentions = rawMentions else {
            throw DecodingError.dataCorruptedError(forKey: .mentions, in: values, debugDescription: "mentions is not a valid [String]")
        }

        guard let content = rawContent else {
            throw DecodingError.dataCorruptedError(forKey: .content, in: values, debugDescription: "content is not a valid String")
        }

        guard let isReblog = rawIsReblog else {
            throw DecodingError.dataCorruptedError(forKey: .isReplog, in: values, debugDescription: "isReblog is not a valid Bool")
        }

        guard let mediaAttachmentsURLs = rawMediaAttachmentsURLs else {
            throw DecodingError.dataCorruptedError(forKey: .mediaAttachmentsURLs, in: values, debugDescription: "mediaAttachmentsURLs is not a valid [String]")
        }

        guard let tags = rawTags else {
            throw DecodingError.dataCorruptedError(forKey: .tags, in: values, debugDescription: "tags is not a valid [Any]")
        }

        guard let emojies = rawEmojies else {
            throw DecodingError.dataCorruptedError(forKey: .emojies, in: values, debugDescription: "emojies is not a valid [Any]")
        }

        guard let card = rawCard else {
            throw DecodingError.dataCorruptedError(forKey: .card, in: values, debugDescription: "card is not a valid String")
        }

        guard let poll = rawPoll else {
            throw DecodingError.dataCorruptedError(forKey: .poll, in: values, debugDescription: "poll is not a valid String")
        }

        self.id = id
        self.postURL = postURL
        self.postURI = postURI
        self.visibility = visibility
        self.repliesCount = repliesCount
        self.reblogsCount = reblogsCount
        self.favouritesCount = favouritesCount
        self.createdAt = createdAt
        self.editedAt = editedAt
        self.application = application
        self.account = account
        self.mentions = mentions
        self.content = content
        self.isReblog = isReblog
        self.mediaAttachmentsURLs = mediaAttachmentsURLs
        self.tags = tags
        self.emojies = emojies
        self.card = card
        self.poll = poll
    }
}
