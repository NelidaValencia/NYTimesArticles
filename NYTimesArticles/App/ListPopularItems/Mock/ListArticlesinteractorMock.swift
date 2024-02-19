//
//  ListArticlesinteractorMock.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation

class ListArticlesinteractorMock: ListItemsProtocol {
    func getListPopularItems() async -> PopularItemResponseEntity {
        return PopularItemResponseEntity(
            status: "OK",
            copyright: "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
            num_results: 20,
            results: [
                .init(
                    title: "Who Kissed First? Archaeology Has an Answer.",
                    byline: "By Franz Lidz",
                    published_date: "2024-02-13",
                    abstract: "A married pair of researchers have “set the record straight” on the ancient history of smooching."
                )
            ])
    }
    
    
}
