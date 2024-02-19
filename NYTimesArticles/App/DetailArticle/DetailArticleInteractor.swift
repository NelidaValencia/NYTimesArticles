//
//  DetailArticleInteractor.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
protocol DetailArticleProtocol {
    func getDetailArticle(articles: PopularItemEntity) async -> PopularItemEntity
}

class DetailArticleInteractor : DetailArticleProtocol{
    func getDetailArticle(articles: PopularItemEntity) async -> PopularItemEntity {
        return articles
    }
}
