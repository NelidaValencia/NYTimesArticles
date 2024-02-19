//
//  DetailArticlePresenter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
protocol DetailArticlePresenterUI {
    func updateUI(viewModel: DetailViewModel)
}

protocol DetailArticlePresentable : AnyObject {
    var ui : DetailArticlePresenterUI? {get}
    func onViewAppear() async
}

class DetailArticlePresenter : DetailArticlePresentable{
    var ui : DetailArticlePresenterUI?
    let interactor: DetailArticleProtocol
    private let mapper : DetailMapper
    private let articles: PopularItemEntity
    var viewModel: DetailViewModel!
    
    init(articles: PopularItemEntity, interactor: DetailArticleProtocol, mapper : DetailMapper = DetailMapper()) {
        self.interactor = interactor
        self.mapper = mapper
        self.articles = articles
    }
    
    func onViewAppear() async {
        let model = await interactor.getDetailArticle(articles: articles)
        viewModel = mapper.map(entity: model)
        ui?.updateUI(viewModel: viewModel)
    }
}
