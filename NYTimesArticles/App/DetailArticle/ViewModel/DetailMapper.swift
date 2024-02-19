//
//  DetailMapper.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
struct DetailMapper {
    func map(entity: PopularItemEntity) -> DetailViewModel {
        .init(title: entity.title,
              byline: entity.byline,
              published_date: entity.publisheddate,
              abstract: entity.abstract,
              url: URL(string: entity.url)
        )
    }
}
