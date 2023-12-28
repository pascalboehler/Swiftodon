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
    
    func testMentionDecoding() throws {
        let testJSON =
        """
        {
            "id": "12345",
            "username": "Hans",
            "url": "https://mastodon.example",
            "acct": "Hans@mastodon.example"
        }
        """.data(using: .utf8)!
        let mention = try JSONDecoder().decode(Mention.self, from: testJSON)
        XCTAssertEqual(mention.id, "12345")
    }
    
    func testPollDecoding() throws {
        let testJSON =
        """
        {
          "id": "34830",
          "expires_at": "2019-12-05T04:05:08.302Z",
          "expired": true,
          "multiple": false,
          "votes_count": 10,
          "voters_count": null,
          "voted": true,
          "own_votes": [
            1
          ],
          "options": [
            {
              "title": "accept",
              "votes_count": 6
            },
            {
              "title": "deny",
              "votes_count": 4
            }
          ],
          "emojis": []
        }
        """.data(using: .utf8)!
        
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
    
    func testCardEncoding() throws {
        let testVideoJSON =
        """
        {
          "url": "https://www.youtube.com/watch?v=OMv_EPMED8Y",
          "title": "♪ Brand New Friend (Christmas Song!)",
          "description": "",
          "type": "video",
          "author_name": "YOGSCAST Lewis & Simon",
          "author_url": "https://www.youtube.com/user/BlueXephos",
          "provider_name": "YouTube",
          "provider_url": "https://www.youtube.com/",
          "html": "<iframe width=\\"480\\" height=\\"270\\" src=\\"https://www.youtube.com/embed/OMv_EPMED8Y?feature=oembed\\" frameborder=\\"0\\" allowfullscreen=\\"\\"></iframe>",
          "width": 480,
          "height": 270,
          "image": "https://files.mastodon.social/preview_cards/images/014/179/145/original/9cf4b7cf5567b569.jpeg",
          "embed_url": "",
          "blurhash": "UvK0HNkV,:s9xBR%njog0fo2W=WBS5ozofV@"
        }
        """.data(using: .utf8)!
        
        let testPhotoJSON =
        """
        {
          "url": "https://www.flickr.com/photos/tomfenskephotography/49088768431/",
          "title": "Oregon",
          "description": "",
          "type": "photo",
          "author_name": "Tom Fenske Photography",
          "author_url": "https://www.flickr.com/photos/tomfenskephotography/",
          "provider_name": "Flickr",
          "provider_url": "https://www.flickr.com/",
          "html": "",
          "width": 1024,
          "height": 427,
          "image": "https://files.mastodon.social/preview_cards/images/014/287/139/original/651b1c6976817824.jpeg",
          "embed_url": "https://live.staticflickr.com/65535/49088768431_6a4322b3bb_b.jpg",
          "blurhash": "UnE{@jt6M_oIAhjYs+ayT2WBf9ayRkkDXAj["
        }
        """.data(using: .utf8)!
        
        let testLinkJSON =
        """
        {
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
          "embed_url": "",
          "blurhash": null
        }
        """.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder()
        
        let imageCard = try jsonDecoder.decode(Card.self, from: testPhotoJSON)
        let videoCard = try jsonDecoder.decode(Card.self, from: testVideoJSON)
        let linkCard = try jsonDecoder.decode(Card.self, from: testLinkJSON)
        
        XCTAssertEqual(imageCard.type, .photo)
        XCTAssertEqual(videoCard.type, .video)
        XCTAssertEqual(linkCard.type, .link)
    }
    
    func testMediaAttachmentDecoding() throws {
        let testAudioJSON =
        """
        {
          "id": "21165404",
          "type": "audio",
          "url": "https://files.mastodon.social/media_attachments/files/021/165/404/original/a31a4a46cd713cd2.mp3",
          "preview_url": "https://files.mastodon.social/media_attachments/files/021/165/404/small/a31a4a46cd713cd2.mp3",
          "remote_url": null,
          "text_url": "https://mastodon.social/media/5O4uILClVqBWx0NNgvo",
          "meta": {
            "length": "0:06:42.86",
            "duration": 402.86,
            "audio_encode": "mp3",
            "audio_bitrate": "44100 Hz",
            "audio_channels": "stereo",
            "original": {
              "duration": 402.860408,
              "bitrate": 166290
            }
          },
          "description": null,
          "blurhash": null
        }
        """.data(using: .utf8)!
        
        let audioMedia = try JSONDecoder().decode(MediaAttachment.self, from: testAudioJSON)
        
        XCTAssertEqual(audioMedia.type, .audio)
        XCTAssertNotNil(audioMedia.meta)
    }
    
    func testAccountDecoding() throws {
        let testJSON =
        """
        {
          "id": "23634",
          "username": "noiob",
          "acct": "noiob@awoo.space",
          "display_name": "ikea shark fan account",
          "locked": false,
          "bot": false,
          "created_at": "2017-02-08T02:00:53.274Z",
          "note": "<p>:ms_rainbow_flag:​ :ms_bisexual_flagweb:​ :ms_nonbinary_flag:​ <a href=\\"https://awoo.space/tags/awoo\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>awoo</span}.space <a href=\\"https://awoo.space/tags/admin\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>admin</span} ~ <a href=\\"https://awoo.space/tags/bi\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>bi</span} ~ <a href=\\"https://awoo.space/tags/nonbinary\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>nonbinary</span} ~ compsci student ~ likes video <a href=\\"https://awoo.space/tags/games\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>games</span} and weird/ old electronics and will post obsessively about both ~ avatar by <span class=\\"h-card\\"><a href=\\"https://weirder.earth/@dzuk\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>dzuk</span}</span></p>",
          "url": "https://awoo.space/@noiob",
          "avatar": "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png",
          "avatar_static": "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png",
          "header": "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png",
          "header_static": "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png",
          "followers_count": 547,
          "following_count": 404,
          "statuses_count": 28468,
          "last_status_at": "2019-11-17",
          "emojis": [
            {
              "shortcode": "ms_rainbow_flag",
              "url": "https://files.mastodon.social/custom_emojis/images/000/028/691/original/6de008d6281f4f59.png",
              "static_url": "https://files.mastodon.social/custom_emojis/images/000/028/691/static/6de008d6281f4f59.png",
              "visible_in_picker": true
            },
            {
              "shortcode": "ms_bisexual_flag",
              "url": "https://files.mastodon.social/custom_emojis/images/000/050/744/original/02f94a5fca7eaf78.png",
              "static_url": "https://files.mastodon.social/custom_emojis/images/000/050/744/static/02f94a5fca7eaf78.png",
              "visible_in_picker": true
            },
            {
              "shortcode": "ms_nonbinary_flag",
              "url": "https://files.mastodon.social/custom_emojis/images/000/105/099/original/8106088bd4782072.png",
              "static_url": "https://files.mastodon.social/custom_emojis/images/000/105/099/static/8106088bd4782072.png",
              "visible_in_picker": true
            }
          ],
          "fields": [
            {
              "name": "Pronouns",
              "value": "they/them",
              "verified_at": null
            },
            {
              "name": "Alt",
              "value": "<span class=\\"h-card\\"><a href=\\"https://cybre.space/@noiob\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>noiob</span}</span>",
              "verified_at": null
            },
            {
              "name": "Bots",
              "value": "<span class=\\"h-card\\"><a href=\\"https://botsin.space/@darksouls\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>darksouls</span}</span>, <span class=\\"h-card\\"><a href=\\"https://botsin.space/@nierautomata\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>nierautomata</span}</span>, <span class=\\"h-card\\"><a href=\\"https://mastodon.social/@fedi\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>fedi</span}</span>, code for <span class=\\"h-card\\"><a href=\\"https://botsin.space/@awoobot\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>awoobot</span}</span>",
              "verified_at": null
            },
            {
              "name": "Website",
              "value": "<a href=\\"http://shork.xyz\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">http://</span><span class=\\"\\">shork.xyz</span><span class=\\"invisible\\"></span}",
              "verified_at": "2019-11-10T10:31:10.744+00:00"
            }
          ]
        }
        """.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder()
        let account = try jsonDecoder.decode(Account.self, from: testJSON)
        XCTAssertEqual(account.username, "noiob")
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
        //let post = try decoder.decode([Post].self, from: testJSONString)
        
       // XCTAssertEqual(post[0].id, "111613128503109275")
    }
}
