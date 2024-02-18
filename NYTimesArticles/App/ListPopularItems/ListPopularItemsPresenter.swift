//
//  ListPopularItemsPresenter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import Foundation

protocol ListPopularItemsUI: AnyObject {
    func update(items: [PopularItemEntity])
}

class ListPopularItemsPresenter {
    var ui: ListPopularItemsUI?
    private let listOfItemPopularInteractor: ListPopularItemsInteractor
    
    init(listOfItemPopularInteractor: ListPopularItemsInteractor) {
        self.listOfItemPopularInteractor = listOfItemPopularInteractor
    }
    
    func onViewAppear() {
        Task{
            let models = await listOfItemPopularInteractor.getListPopularItems()
            ui?.update(items: models.results)
        }
    }
}
