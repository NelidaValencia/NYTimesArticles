//
//  Mock.swift
//  NYTimesArticlesTests
//
//  Created by Slacker on 19/02/24.
//

import Foundation
import UIKit

@testable import NYTimesArticles

var mockPopularItemResponseEntity:PopularItemResponseEntity =  PopularItemResponseEntity(status: "200", copyright: "", num_results: 100, results: [
    PopularItemEntity(title: "post1", byline: "", publisheddate: "", abstract: "", url: "", media: [] ),
    PopularItemEntity(title: "post2", byline: "", publisheddate: "", abstract: "", url: "", media: [])])

struct ListPopularItemsInteractorMock: ListItemsProtocol{
    func getListPopularItems() async -> NYTimesArticles.PopularItemResponseEntity {
        return mockPopularItemResponseEntity
    }
}

struct ListPopularItemsUIMock: ListPopularItemsUI {
    func update(items: [NYTimesArticles.ViewModel]) {
        print("update")
    }
}

struct ListPopularItemsRouterMock: ListPopularItemsRouting{
    var detailRouting: NYTimesArticles.DetailArticleRouting?
    
    var listArticleView: NYTimesArticles.ListPopularItemsView?
    
    func showListOfArticles(window: UIWindow?) {
        print("showListOfArticles")
    }
    
    func showDetailArticle(article: NYTimesArticles.PopularItemEntity) {
        print("showDetailArticle")
    }
}

var mockPopularItemEntity:PopularItemEntity =
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

