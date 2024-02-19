//
//  ListPopularItemsView.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class ListPopularItemsView: UIViewController {
    var loader : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.isHidden = true
        activity.layer.masksToBounds = true
        activity.activityIndicatorViewStyle = .large
        return activity
    }()
    
    var titleImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "NYTLogo")
        return imageView
    }()
    
    private var itemsTableView: UITableView = {
        let tableView = UITableView()
        tableView.accessibilityIdentifier = "UITableID"
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ArticleCellView.self, forCellReuseIdentifier: "ArticleCellView")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private let presenter: ListArticlePresentable
    
    init(presenter: ListArticlePresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableView()
        loadData()
    }
    
    private func loadData() {
        Task{ [weak self] in
            await self?.presenter.fetchPopularItems()
        }
    }
    
    private func setUpTableView() {
        view.addSubview(itemsTableView)
        view.addSubview(titleImage)
        view.addSubview(loader)
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleImage.heightAnchor.constraint(equalToConstant: 100),
            titleImage.widthAnchor.constraint(equalToConstant: 300),
            
            itemsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            itemsTableView.topAnchor.constraint(equalTo: titleImage.topAnchor, constant: 80)
        ])
        loader.isHidden = false
        loader.color = .systemGray
        loader.startAnimating()
        itemsTableView.isHidden = true
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
    }
}

extension ListPopularItemsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension ListPopularItemsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCellView", for: indexPath) as! ArticleCellView
        let model = presenter.viewModels[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    
}

extension ListPopularItemsView: ListPopularItemsUI {
    func update(items: [ViewModel]) {
        print("Items", items)
        DispatchQueue.main.async {
            self.itemsTableView.isHidden = false
            self.loader.stopAnimating()
            self.itemsTableView.reloadData()
        }
    }
}
