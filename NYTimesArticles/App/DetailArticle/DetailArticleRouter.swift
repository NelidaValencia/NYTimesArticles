//
//  DetailArticleRouter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

protocol DetailArticleRouting {
    func showDetail(fromViewController: UIViewController, article: PopularItemEntity)
}

class DetailArticleRouter: DetailArticleRouting {
    func showDetail(fromViewController: UIViewController, article: PopularItemEntity)  {
        let interactor = DetailArticleInteractor()
        let presenter = DetailArticlePresenter(articles: article, interactor: interactor, mapper: DetailMapper())
        let view = DetailArticleView(presenter: presenter)
        presenter.ui = view
        view.modalPresentationStyle = .fullScreen
        fromViewController.present(view, animated: true)
    }
}
