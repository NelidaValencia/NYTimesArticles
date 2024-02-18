//
//  ListPopularItemsView.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class ListPopularItemsView: UIViewController {
    
    private var itemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    
    var presenter: ListPopularItemsPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        presenter?.onViewAppear()
    }
}

extension ListPopularItemsView: ListPopularItemsUI {
    func update(items: [PopularItemEntity]) {
        print("Items", items)
    }
}
