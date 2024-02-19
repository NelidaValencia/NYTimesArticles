//
//  DetailArticleView.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class DetailArticleView: UIViewController {
    var loader : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.isHidden = true
        activity.layer.masksToBounds = true
        activity.activityIndicatorViewStyle = .large
        return activity
    }()
    
    private let buttonClose : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        return button
    }()
    
    let detailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(
            ofSize: 25,
            weight: .bold,
            width: .condensed
        )
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.font = .systemFont(
            ofSize: 18,
            weight: .regular,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        return label
    }()
    
    let detailAuthorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(
            ofSize: 14,
            weight: .medium,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    let detailDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(
            ofSize: 12,
            weight: .regular,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    private let presenter : DetailArticlePresentable
    
    
    init(presenter: DetailArticlePresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        loadData()
    }
    
    private func loadData(){
        Task{[weak self] in
            await self?.presenter.onViewAppear()
        }
    }
    
    func setUpView() {
        view.addSubview(buttonClose)
        view.addSubview(detailImage)
        view.addSubview(detailTitleLabel)
        view.addSubview(detailDescriptionLabel)
        view.addSubview(detailAuthorLabel)
        view.addSubview(detailDateLabel)
        view.addSubview(loader)
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            buttonClose.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImage.topAnchor.constraint(equalTo: buttonClose.bottomAnchor, constant: 12),
            detailImage.heightAnchor.constraint(equalToConstant: 10),
            detailImage.widthAnchor.constraint(equalToConstant: 10),
            detailTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailTitleLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 10),
            detailDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailDescriptionLabel.topAnchor.constraint(equalTo: detailTitleLabel.bottomAnchor, constant: 20),
            detailAuthorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            detailAuthorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailAuthorLabel.topAnchor.constraint(equalTo: detailDescriptionLabel.bottomAnchor, constant: 20),
            detailDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            detailDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailDateLabel.topAnchor.constraint(equalTo: detailAuthorLabel.bottomAnchor)
            
        ])
        
        buttonClose.isHidden = true
        loader.color = .systemGray
        loader.startAnimating()
        buttonClose.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        buttonClose.addTarget(self, action: #selector(ActionButton), for: .touchUpInside)
        buttonClose.tintColor = .black
    }
    
    @objc func ActionButton(button: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
}

extension DetailArticleView: DetailArticlePresenterUI {
    func updateUI(viewModel: DetailViewModel) {
        loader.stopAnimating()
        buttonClose.isHidden = false
        detailDateLabel.text = viewModel.published_date
        detailTitleLabel.text = viewModel.title
        detailAuthorLabel.text = viewModel.byline
        detailDescriptionLabel.text = viewModel.abstract
    }
}
