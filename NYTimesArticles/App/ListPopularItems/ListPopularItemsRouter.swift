//
//  ListPopularItemsRouter.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class ListPopularItemsRouter {
    func showListOfMovies(window: UIWindow?) {
        var view = ListPopularItemsView()
        let interactor = ListPopularItemsInteractor()
        let presenter = ListPopularItemsPresenter(listOfItemPopularInteractor: interactor)
        presenter.ui = view
        view.presenter = presenter
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
