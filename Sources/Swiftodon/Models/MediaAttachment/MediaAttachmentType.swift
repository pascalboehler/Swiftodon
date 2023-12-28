//
//  MediaAttachmentType.swift
//
//
//  Created by Pingu on 28.12.23.
//

import Foundation

public enum MediaAttachmentType: String, Decodable {
    /// unsupported / unknown file type
    case unknown = "unknown"
    /// Static image
    case image = "image"
    /// Looping, soundless animation
    case gifv = "gifv"
    /// Video clip
    case video = "video"
    /// Audio track
    case audio = "audio"
    
}
