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
    func onViewAppear()
}

protocol ListPopularItemsUI: AnyObject {
    func update(items: [ViewModel])
}

class ListPopularItemsPresenter: ListArticlePresentable {
    weak var ui: ListPopularItemsUI?
    private let listOfItemPopularInteractor: ListItemsProtocol
    var viewModels: [ViewModel] = []
    private let mapper: Mapper
    
    init(listOfItemPopularInteractor: ListItemsProtocol, mapper: Mapper = Mapper()) {
        self.listOfItemPopularInteractor = listOfItemPopularInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task{
            let models = await listOfItemPopularInteractor.getListPopularItems().results
            viewModels = models.map(mapper.mapper(entity:))
            ui?.update(items: viewModels)
        }
    }
}
