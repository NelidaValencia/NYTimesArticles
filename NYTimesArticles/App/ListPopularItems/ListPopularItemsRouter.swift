//
//  ListPopularItemsRouter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

protocol ListPopularItemsRouting {
    var detailRouting: DetailArticleRouting? { get }
    var listArticleView : ListPopularItemsView? { get }
    func showListOfArticles(window: UIWindow?)
    func showDetailArticle(article: PopularItemEntity)
}

class ListPopularItemsRouter: ListPopularItemsRouting {
    
    
    var detailRouting: DetailArticleRouting?
    var listArticleView : ListPopularItemsView?
    
    func showListOfArticles(window: UIWindow?) {
        self.detailRouting = DetailArticleRouter()
        let interactor = ListPopularItemsInteractor() //ListArticlesinteractorMock()
        let presenter = ListPopularItemsPresenter(listOfItemPopularInteractor: interactor, routerDetail: self)
        listArticleView = ListPopularItemsView(presenter: presenter)
        presenter.ui = listArticleView
        window?.rootViewController = listArticleView
        window?.makeKeyAndVisible()
    }

    func showDetailArticle(article: PopularItemEntity) {
        guard let fromView = listArticleView else{
            return
        }
        detailRouting?.showDetail(fromViewController: fromView, article: article)
    }
    
    
}
