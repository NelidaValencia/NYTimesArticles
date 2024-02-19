//
//  ListPopularItemsPresenter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import Foundation

protocol ListArticlePresentable: AnyObject {
    var ui: ListPopularItemsUI? { get }
    var viewModels: [ViewModel] { get }
    func fetchPopularItems() async
    func onTapCell(atIndex: Int)
}

protocol ListPopularItemsUI {
    func update(items: [ViewModel])
}

class ListPopularItemsPresenter: ListArticlePresentable {
    var ui: ListPopularItemsUI?
    let listOfItemPopularInteractor: ListItemsProtocol
    var viewModels: [ViewModel] = []
    var models: [PopularItemEntity] = []
    private let mapper: Mapper
    let routerDetail: ListPopularItemsRouting
    
    init(listOfItemPopularInteractor: ListItemsProtocol, mapper: Mapper = Mapper(), routerDetail: ListPopularItemsRouting) {
        self.listOfItemPopularInteractor = listOfItemPopularInteractor
        self.mapper = mapper
        self.routerDetail = routerDetail
    }
    
    func fetchPopularItems() async {
        models = await listOfItemPopularInteractor.getListPopularItems().results
        viewModels = models.map(mapper.mapper(entity:))
        ui?.update(items: viewModels)
    }
    
    func onTapCell(atIndex: Int) {
        let article = models[atIndex]
        print(article)
        routerDetail.showDetailArticle(article: article)
    }
    
}
