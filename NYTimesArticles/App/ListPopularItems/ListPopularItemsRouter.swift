//
//  ListPopularItemsRouter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class ListPopularItemsRouter {
    func showListOfArticles(window: UIWindow?) {
        let interactor = ListPopularItemsInteractor() //ListArticlesinteractorMock()
        let presenter = ListPopularItemsPresenter(listOfItemPopularInteractor: interactor)
        let view = ListPopularItemsView(presenter: presenter)
        presenter.ui = view
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
