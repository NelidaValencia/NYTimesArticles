//
//  ArticleCellView.swift
//  NYTimesArticles
//
//  Created by Slacker on 18/02/24.
//

import Foundation
import UIKit

class ArticleCellView: UITableViewCell {
    let articleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(
            ofSize: 20,
            weight: .bold,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let articleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(
            ofSize: 16,
            weight: .medium,
            width: .condensed
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(articleImage)
        addSubview(articleTitleLabel)
        addSubview(articleDescriptionLabel)
        
        NSLayoutConstraint.activate([
            articleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            articleImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            articleImage.heightAnchor.constraint(equalToConstant: 150),
            articleImage.widthAnchor.constraint(equalToConstant: 100),
            articleImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            articleTitleLabel.leadingAnchor.constraint(equalTo: articleImage.leadingAnchor, constant: 20),
            articleTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            articleTitleLabel.topAnchor.constraint(equalTo: articleImage.topAnchor, constant: 12),
            
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: articleImage.leadingAnchor, constant: 20),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            articleDescriptionLabel.topAnchor.constraint(equalTo: articleTitleLabel.topAnchor, constant: 50)
        ])
    }
    
    func configure(model: ViewModel) {
        articleTitleLabel.text = model.title
        articleDescriptionLabel.text = model.abstract
    }
}
