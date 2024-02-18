//
//  ListPopularItemsInteractor.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
//qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ
class ListPopularItemsInteractor {
    func getListPopularItems() async -> PopularItemResponseEntity {
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/7.json?api-key=qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularItemResponseEntity.self, from: data)
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error {
//                print("Error")
//            }
//            
//            if let data = data,
//               let httpResponse = response as? HTTPURLResponse,
//               httpResponse.statusCode == 200 {
//                articlesDataModel = try! JSONDecoder().decode(PopularItemResponseEntity.self, from: data)
//                print("Items \(articlesDataModel)")
//            }
//            
//        }.resume()
//        return articlesDataModel ??
    }
}
