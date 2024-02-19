//
//  Mapper.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation

struct Mapper {
    func mapper(entity: PopularItemEntity) -> ViewModel {
        ViewModel(title: entity.title, 
                  byline: entity.byline,
                  published_date: entity.publisheddate,
                  abstract: entity.abstract
        )
    }
}
