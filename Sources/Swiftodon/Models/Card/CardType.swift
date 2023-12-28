//
//  File.swift
//  
//
//  Created by Pingu on 28.12.23.
//

import Foundation

public enum CardType: String {
    /// Link OEmbed
    case link = "link"
    
    /// Photo OEmbed
    case photo = "photo"
    
    /// Video OEmbed
    case video = "video"
    
    /// iframe OEmbed; Not currenlty accepted and supported!
    case rich = "rich"
}
