//
//  DetailArticleEntity.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation

struct DetailArticleEntity: Decodable {
    var title: String
    var byline: String
    var published_date: String
    var abstract: String
}
