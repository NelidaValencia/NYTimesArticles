//
//  PopularItemEntity.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation

struct PopularItemResponseEntity: Decodable {
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

struct PopularItemEntity: Decodable {
    var title: String
    var byline: String
    var published_date: String
    var abstract: String
//    var media: [MediaMetadataItem] = []
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case byline = "byline"
        case published_date = "published_date"
        case abstract = "abstract"
    }
}

struct MediaMetadataItem: Decodable {
    var media_metadata: [MediaItem] = []
    
    enum CodingKeys: String, CodingKey {
        case media_metadata = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.media_metadata = try container.decode([MediaItem].self, forKey: .media_metadata)
    }
}

struct MediaItem: Decodable {
    var url: String? = ""
    var format: String? = ""
    var height: String? = ""
    var width: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}
