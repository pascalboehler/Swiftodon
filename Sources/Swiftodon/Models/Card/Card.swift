//
//  Card.swift
//  
//
//  Created by Pingu on 28.12.23.
//

import Foundation

public struct Card {
    /// general
    public var url: String
    public var title: String
    
    /// Card type presented to user
    public var type: CardType
    
    /// author and provider
    public var authorURL : String
    public var providerName: String
    public var providerURL: String
    
    /// HTML Object for rendering
    public var html: String
    
    /// dimensions
    public var height: Int
    public var width: Int
    
    /// additional
    public var previewImageURL: String?
    public var embedURL: String /// for photo embeds
    
    /// BlurHash: Can be used to generate colourful previews
    public var blurhash: String
}
