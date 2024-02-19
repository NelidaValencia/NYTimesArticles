//
//  MockDetailArticle.swift
//  NYTimesArticlesTests
//
//  Created by Slacker on 19/02/24.
//

import Foundation
@testable import NYTimesArticles

var mockPopularItemEntity: PopularItemEntity =
    PopularItemEntity(title: "post1", byline: "", publisheddate: "", abstract: "", url: "", media: [] )

struct DetailArticleInteractorMock: DetailArticleProtocol {
    func getDetailArticle(articles: NYTimesArticles.PopularItemEntity) async -> NYTimesArticles.PopularItemEntity {
        return mockPopularItemEntity
    }
}

struct DetailArticlePresenterUIMock: DetailArticlePresenterUI {
    func updateUI(viewModel: NYTimesArticles.DetailViewModel) {
        print("update")
    }
}
