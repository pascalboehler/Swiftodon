//
//  MediaAttachment.swift
//
//
//  Created by Pingu on 28.12.23.
//

import Foundation

public struct MediaAttachment {
    public var id: String
    
    public var type: MediaAttachmentType
    
    /// URLs
    public var url: String
    public var previewURL: String
    public var remoteURL: String?
    
    /// MetaData
    //FIXME: This should decode json to readable format => not working rn
    public var meta: [String: Any]? // this might blow up...
    
    /// Additional
    public var description: String?
    public var blurhash: String?
}
