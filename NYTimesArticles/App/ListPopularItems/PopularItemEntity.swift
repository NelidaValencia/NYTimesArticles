//
//  PopularItemEntity.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation

struct PopularItemResponseEntity: Codable {
    var status: String
    var copyright: String
    var num_results: Int
    var results: [PopularItemEntity]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
}

struct PopularItemEntity: Codable {
    var title: String
    var byline: String
    var publisheddate: String
    var abstract: String
    var url: String
    var media: [MediaMetadataItem]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case byline = "byline"
        case publisheddate = "published_date"
        case abstract = "abstract"
        case url = "url"
        case media = "media"
    }
}

struct MediaMetadataItem: Codable {
    var type: String
    var subtype: String
    var caption: String
    var copyright: String
    var approvedforsyndication: Int
    var mediametadata: [MediaItem]
    
    enum CodingKeys: String, CodingKey {
        case mediametadata = "media-metadata"
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approvedforsyndication = "approved_for_syndication"
    }
}

struct MediaItem: Codable {
    var url: String
    var format: String
    var height: Int
    var width: Int
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}
