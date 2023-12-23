//
//  DecoderTests.swift
//  
//
//  Created by Pingu on 23.12.23.
//

import XCTest
@testable import Swiftodon

final class DecoderTests: XCTestCase {
    
    func testApplicationDecoding() throws {
        let testJSON =
        """
        {
            "name": "testme",
            "website": "https://test.me"
        }
        """.data(using: .utf8)!
        let jsonDecoder = JSONDecoder()
        let application = try jsonDecoder.decode(Application.self, from: testJSON)
        XCTAssertEqual(application.name, "testme")
    }
    
    func testAccountDecoding() throws {
        let testJSON =
        """
        {
            "id": "108198211110269347",
            "username": "segurancalegal",
            "acct": "segurancalegal",
            "display_name": "Podcast Seguran Legal",
            "locked": false,
            "bot": false,
            "discoverable": false,
            "group": false,
            "created_at": "2022-04-26T00:00:00.000Z",
            "note": "lorem",
            "url": "https://mastodon.social/@segurancalegal",
            "uri": "https://mastodon.social/users/segurancalegal",
            "avatar": "https://files.mastodon.social/accounts/avatars/108/198/211/110/269/347/original/c234e03f7ce3d5fe.png",
            "avatar_static": "https://files.mastodon.social/accounts/avatars/108/198/211/110/269/347/original/c234e03f7ce3d5fe.png",
            "header": "https://files.mastodon.social/accounts/headers/108/198/211/110/269/347/original/639e9fa74549a9ad.jpeg",
            "header_static": "https://files.mastodon.social/accounts/headers/108/198/211/110/269/347/original/639e9fa74549a9ad.jpeg",
            "followers_count": 143,
            "following_count": 57,
            "statuses_count": 55,
            "last_status_at": "2023-12-20",
            "noindex": false,
            "emojis": [],
            "roles": [],
            "fields": []
        }
        """.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder()
        let account = try jsonDecoder.decode(Account.self, from: testJSON)
        XCTAssertEqual(account.username, "segurancalegal")
    }
    
    func testPostDecoding() throws {
        var testJSONString =
        """
        [
            {
                "id": "111613128503109275",
                "created_at": "2023-12-20T14:06:24.437Z",
                "in_reply_to_id": null,
                "in_reply_to_account_id": null,
                "sensitive": false,
                "spoiler_text": "",
                "visibility": "public",
                "language": "pt",
                "uri": "https://mastodon.social/users/segurancalegal/statuses/111613128503109275",
                "url": "https://mastodon.social/@segurancalegal/111613128503109275",
                "replies_count": 0,
                "reblogs_count": 0,
                "favourites_count": 0,
                "edited_at": null,
                "content": "",
                "reblog": null,
                "application": {
                    "name": "Elk",
                    "website": "https://elk.zone"
                },
                "account": {
                    "id": "108198211110269347",
                    "username": "segurancalegal",
                    "acct": "segurancalegal",
                    "display_name": "Podcast Seguran Legal",
                    "locked": false,
                    "bot": false,
                    "discoverable": false,
                    "group": false,
                    "created_at": "2022-04-26T00:00:00.000Z",
                    "note": "",
                    "url": "https://mastodon.social/@segurancalegal",
                    "uri": "https://mastodon.social/users/segurancalegal",
                    "avatar": "https://files.mastodon.social/accounts/avatars/108/198/211/110/269/347/original/c234e03f7ce3d5fe.png",
                    "avatar_static": "https://files.mastodon.social/accounts/avatars/108/198/211/110/269/347/original/c234e03f7ce3d5fe.png",
                    "header": "https://files.mastodon.social/accounts/headers/108/198/211/110/269/347/original/639e9fa74549a9ad.jpeg",
                    "header_static": "https://files.mastodon.social/accounts/headers/108/198/211/110/269/347/original/639e9fa74549a9ad.jpeg",
                    "followers_count": 143,
                    "following_count": 57,
                    "statuses_count": 55,
                    "last_status_at": "2023-12-20",
                    "noindex": false,
                    "emojis": [],
                    "roles": [],
                    "fields": []
                },
                "media_attachments": [],
                "mentions": [],
                "tags": [],
                "emojis": [],
                "card": null,
                "poll": null
            }
        ]

        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let post = try decoder.decode([Post].self, from: testJSONString)
        
        XCTAssertEqual(post[0].id, "111613128503109275")
    }
}
