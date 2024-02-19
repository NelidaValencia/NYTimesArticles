//
//  ListPopularItemsInteractor.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation

protocol ListItemsProtocol {
    func getListPopularItems() async -> PopularItemResponseEntity
}

class ListPopularItemsInteractor: ListItemsProtocol {
    func getListPopularItems() async -> PopularItemResponseEntity {
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/7.json?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularItemResponseEntity.self, from: data)
    }
}

