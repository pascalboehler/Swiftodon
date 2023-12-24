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
        let testJSONString =
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
                "content": "<p>Riscos de compartilhar fotos e v\\u00eddeos de crian\\u00e7as nas redes sociais</p><p><a href=\\"https://www.brownpipe.com.br/riscos-de-compartilhar-fotos-e-videos-de-criancas-nas-redes-sociais/\\" target=\\"_blank\\" rel=\\"nofollow noopener noreferrer\\" translate=\\"no\\"><span class=\\"invisible\\">https://www.</span><span class=\\"ellipsis\\">brownpipe.com.br/riscos-de-com</span><span class=\\"invisible\\">partilhar-fotos-e-videos-de-criancas-nas-redes-sociais/</span></a></p>",
                "reblog": null,
                "application": {
                    "name": "Elk",
                    "website": "https://elk.zone"
                },
                "account": {
                    "id": "108198211110269347",
                    "username": "segurancalegal",
                    "acct": "segurancalegal",
                    "display_name": "Podcast Seguran\\u00e7a Legal",
                    "locked": false,
                    "bot": false,
                    "discoverable": false,
                    "group": false,
                    "created_at": "2022-04-26T00:00:00.000Z",
                    "note": "<p>Podcast Seguran\\u00e7a Legal - Direito da TI e SegInfo - Apoio BrownPipe Consultoria - Apoie e participe em  <a href=\\"http://apoia.se/segurancalegal\\" target=\\"_blank\\" rel=\\"nofollow noopener noreferrer\\" translate=\\"no\\"><span class=\\"invisible\\">http://</span><span class=\\"\\">apoia.se/segurancalegal</span><span class=\\"invisible\\"></span></a> e <a href=\\"http://picpay.me/segurancalegal\\" target=\\"_blank\\" rel=\\"nofollow noopener noreferrer\\" translate=\\"no\\"><span class=\\"invisible\\">http://</span><span class=\\"\\">picpay.me/segurancalegal</span><span class=\\"invisible\\"></span></a></p>",
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
