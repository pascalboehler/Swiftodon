//
//  DecoderTests.swift
//  
//
//  Created by Pingu on 23.12.23.
//

import XCTest
@testable import Swiftodon

final class DecoderTests: XCTestCase {
    
    func testEmojiDecoding() throws {
        let testJSON =
        """
        {
          "shortcode": "blobaww",
          "url": "https://files.mastodon.social/custom_emojis/images/000/011/739/original/blobaww.png",
          "static_url": "https://files.mastodon.social/custom_emojis/images/000/011/739/static/blobaww.png",
          "visible_in_picker": true,
          "category": "Blobs"
        }
        """.data(using: .utf8)!
        let emoji = try JSONDecoder().decode(Emoji.self, from: testJSON)
        XCTAssertEqual(emoji.shortcode, "blobaww")
    }
    
    func testFieldDecoding() throws {
        let testJSON =
        """
          {
            "name": "Homepage",
            "value": "<a href=\\"https://zeonfederated.com\\" rel=\\"me nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://</span><span class=\\"\\">zeonfederated.com</span><span class=\\"invisible\\"></span}",
            "verified_at": "2019-07-15T18:29:57.191+00:00"
          }
        """.data(using: .utf8)!
        let field = try JSONDecoder().decode(Field.self, from: testJSON)
        XCTAssertEqual(field.name, "Homepage")
        
    }
    
    func testTagDecoding() throws {
        let testJSON =
        """
        {
            "name": "tech",
            "url": "https://mastodon.social/tags/tech"
        }
        """.data(using: .utf8)!
        let tag = try JSONDecoder().decode(Tag.self, from: testJSON)
        XCTAssertEqual(tag.name, "tech")
        
    }
    
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
            "id": "110664213295228818",
            "username": "ekis",
            "acct": "ekis",
            "display_name": "she hacked you",
            "locked": false,
            "bot": false,
            "discoverable": true,
            "group": false,
            "created_at": "2023-07-06T00:00:00.000Z",
            "note": "<p>shipwrk&#39;d &amp; coma-tose <br />drink&#39;n fresh granatapfel-juice</p><p>security researcher, open-source hardware+software engineer, u26a7dimensional slider, paradoxically lucid, bruja cibernu00e9tica, exile, formallyu2013trained geneticist, netzwerk hexe, bi-polar 2 witch-apologist, amateur mycologist, katzenamt Bu00fcrokrat, dayu2013dreamer, night-timer partyu2013crasher</p><p>+poorly conceived original <a href="https://mastodon.social/tags/music" class="mention hashtag" rel="tag">#<span>music</span></a><br />+stupid posts in english, espau00f1ol, and deutsche</p>",
            "url": "https://mastodon.social/@ekis",
            "uri": "https://mastodon.social/users/ekis",
            "avatar": "https://files.mastodon.social/accounts/avatars/110/664/213/295/228/818/original/23c23646fd6277fa.jpg",
            "avatar_static": "https://files.mastodon.social/accounts/avatars/110/664/213/295/228/818/original/23c23646fd6277fa.jpg",
            "header": "https://files.mastodon.social/accounts/headers/110/664/213/295/228/818/original/bf256571479014b5.jpeg",
            "header_static": "https://files.mastodon.social/accounts/headers/110/664/213/295/228/818/original/bf256571479014b5.jpeg",
            "followers_count": 792,
            "following_count": 1152,
            "statuses_count": 1143,
            "last_status_at": "2023-12-25",
            "noindex": false,
            "emojis": [],
            "roles": [],
            "fields": [
                {
                    "name": "I make music",
                    "value": "<a href="https://shehackedyou.bandcamp.com" target="_blank" rel="nofollow noopener noreferrer me" translate="no"><span class="invisible">https://</span><span class="">shehackedyou.bandcamp.com</span><span class="invisible"></span></a>",
                    "verified_at": "2023-12-20T03:51:26.377+00:00"
                },
                {
                    "name": "I write code",
                    "value": "c,cpp,go,rust,ruby,python,java,js, ..",
                    "verified_at": null
                },
                {
                    "name": "I run linux",
                    "value": "debian,alpine,ubuntu,gentoo, ..",
                    "verified_at": null
                },
                {
                    "name": "I use XMPP",
                    "value": "shehackedyou@xmpp.chat",
                    "verified_at": null
                }
            ]
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
              "id": "103270115826048975",
              "created_at": "2019-12-08T03:48:33.901Z",
              "in_reply_to_id": null,
              "in_reply_to_account_id": null,
              "sensitive": false,
              "spoiler_text": "",
              "visibility": "public",
              "language": "en",
              "uri": "https://mastodon.social/users/Gargron/statuses/103270115826048975",
              "url": "https://mastodon.social/@Gargron/103270115826048975",
              "replies_count": 5,
              "reblogs_count": 6,
              "favourites_count": 11,
              "favourited": false,
              "reblogged": false,
              "muted": false,
              "bookmarked": false,
              "content": "<p>&quot;I lost my inheritance with one wrong digit on my sort code&quot;</p><p><a href=\\"https://www.theguardian.com/money/2019/dec/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://www.</span><span class=\\"ellipsis\\">theguardian.com/money/2019/dec</span><span class=\\"invisible\\">/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code</span}</p>",
              "reblog": null,
              "application": {
                "name": "Web",
                "website": null
              },
              "account": {
                "id": "1",
                "username": "Gargron",
                "acct": "Gargron",
                "display_name": "Eugen",
                "locked": false,
                "bot": false,
                "discoverable": true,
                "group": false,
                "created_at": "2016-03-16T14:34:26.392Z",
                "note": "<p>Developer of Mastodon and administrator of mastodon.social. I post service announcements, development updates, and personal stuff.</p>",
                "url": "https://mastodon.social/@Gargron",
                "avatar": "https://files.mastodon.social/accounts/avatars/000/000/001/original/d96d39a0abb45b92.jpg",
                "avatar_static": "https://files.mastodon.social/accounts/avatars/000/000/001/original/d96d39a0abb45b92.jpg",
                "header": "https://files.mastodon.social/accounts/headers/000/000/001/original/c91b871f294ea63e.png",
                "header_static": "https://files.mastodon.social/accounts/headers/000/000/001/original/c91b871f294ea63e.png",
                "followers_count": 322930,
                "following_count": 459,
                "statuses_count": 61323,
                "last_status_at": "2019-12-10T08:14:44.811Z",
                "emojis": [],
                "fields": [
                  {
                    "name": "Patreon",
                    "value": "<a href=\\"https://www.patreon.com/mastodon\\" rel=\\"me nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://www.</span><span class=\\"\\">patreon.com/mastodon</span><span class=\\"invisible\\"></span}",
                    "verified_at": null
                  },
                  {
                    "name": "Homepage",
                    "value": "<a href=\\"https://zeonfederated.com\\" rel=\\"me nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://</span><span class=\\"\\">zeonfederated.com</span><span class=\\"invisible\\"></span}",
                    "verified_at": "2019-07-15T18:29:57.191+00:00"
                  }
                ]
              },
              "media_attachments": [],
              "mentions": [],
              "tags": [],
              "emojis": [],
              "card": {
                "url": "https://www.theguardian.com/money/2019/dec/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code",
                "title": "‘I lost my £193,000 inheritance – with one wrong digit on my sort code’",
                "description": "When Peter Teich’s money went to another Barclays customer, the bank offered £25 as a token gesture",
                "type": "link",
                "author_name": "",
                "author_url": "",
                "provider_name": "",
                "provider_url": "",
                "html": "",
                "width": 0,
                "height": 0,
                "image": null,
                "embed_url": ""
              },
              "poll": null
            }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let post = try decoder.decode([Post].self, from: testJSONString)
        
        XCTAssertEqual(post[0].id, "111613128503109275")
    }
}
